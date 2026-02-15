// An MCP client endpoint configured to work with OpenAI models.
query chatbot verb=POST {
  api_group = "MCP Client"

  input {
    // The current message from the user.
    text user_query filters=trim
  
    // An optional system message, that will update / replace an existing message. Leave blank to use the conversations existing system message (if one exists).
    text system_prompt? filters=trim
  
    // The existing OpenAI formatted conversation.
    json conversation?
  }

  stack {
    function.run "apiKey/validate" {
      input = {
        public: $env.$http_headers["X-Client"]
        secret: $env.$http_headers["X-Secret"]
      }
    } as $func1
  
    var $server_url {
      value = "https://x6if-wu0q-dtak.n7.xano.io/api:jwozKqfW"
    }
  
    // 1. Request MCP tools & convert them to OpenAI format.
    group {
      stack {
        ai.external.mcp.tool.list {
          url = $server_url
          bearer_token = $env.$request_auth_token
          connection_type = "sse"
        } as $mcp_tools
      
        // Converts the MCP server tools into the required format for the OpenAI api spec.
        util.template_engine {
          value = """
            {# --- Define a macro to transform a single schema node --- #}
            {# Outputs a JSON object representing the transformed schema. #}
            {# top_level_desc: Description explicitly passed from the main loop for top-level properties #}
            {# is_item_schema: True if this schema is being processed as an array item #}
            {%- macro transform_schema(schema, top_level_desc = null, is_item_schema = false) %}
            {#- Default schema if input is invalid/null -#}
            {%- set schema = schema|default({'type': 'string', 'description': 'Schema undefined'}) %}
            
            {#- 1. Determine Primary Type and Nullability -#}
            {%- set primary_type = null %}
            {%- set is_nullable = false %}
            {%- set is_complex_anyof = false %}
            {%- set node_description = schema.description|default(null) %} {# Original description for THIS node #}
            {%- set array_description_lifted = null %} {# To store description lifted from items #}
            
            {%- if schema.type is defined %}
                {%- if schema.type is iterable %}
                    {%- for t in schema.type %}
                        {%- if t == 'null' %}{% set is_nullable = true %}
                        {%- elseif primary_type == null %}{% set primary_type = t %}
                        {%- endif %}
                    {%- endfor %}
                    {%- if primary_type == null and is_nullable %}{% set primary_type = 'string' %}{% endif %}
                {%- else %}
                    {%- set primary_type = schema.type %}
                {%- endif %}
            {# *** ADDED CHECK for anyOf here to correctly identify complex item schemas *** #}
            {%- elseif schema.anyOf is defined and schema.anyOf is iterable and schema.properties is not defined and schema.items is not defined %}
                {%- set primary_type = 'object' %}
                {%- set is_complex_anyof = true %}
            {%- else %}
                {%- set primary_type = 'string' %} {# Fallback #}
            {%- endif %}
            {%- set primary_type = primary_type|default('string') %}
            
            {#- 2. Map to OpenAI Type -#}
            {%- set openai_type = 'string' %} {# Default #}
            {%- if primary_type == 'number' or primary_type == 'integer' or primary_type == 'decimal' %}
                {%- set openai_type = 'number' %}
            {%- elseif primary_type == 'boolean' %}
                {%- set openai_type = 'boolean' %}
            {%- elseif primary_type == 'array' %}
                {%- set openai_type = 'array' %}
            {%- elseif primary_type == 'object' %}
                {%- set openai_type = 'object' %}
            {%- endif %}
            
            {#- 3. Extract Description for Arrays (Lift from items IF node itself lacks description) -#}
            {%- if openai_type == 'array' and not top_level_desc and not node_description %}
                {%- if schema.items is defined %}
                    {%- if schema.items.anyOf is defined and schema.items.anyOf is iterable and schema.items.anyOf|length > 1 and schema.items.anyOf[1].description is defined %}
                        {%- set array_description_lifted = schema.items.anyOf[1].description %}
                    {%- elseif schema.items.description is defined %}
                        {%- set array_description_lifted = schema.items.description %}
                    {%- elseif schema.items.type is defined and schema.items.description is defined %}
                         {%- set array_description_lifted = schema.items.description %}
                    {%- endif %}
                {%- endif %}
            {%- endif %}
            
            {#- 4. Output the Schema JSON Object -#}
            {
                "type": "{{ openai_type }}"{# --- Core type --- #}
                {# --- Determine and Output Description --- #}
                {%- set final_description = null %}
                {# Priority 1: Use description passed explicitly for top-level items #}
                {%- if top_level_desc %}
                    {%- set final_description = top_level_desc %}
                {# Priority 2: Use node's own description (if not overridden by top_level_desc) #}
                {%- elseif node_description %}
                    {%- set final_description = node_description %}
                {# Priority 3: Use lifted description for array (if not overridden and node lacked one) #}
                {%- elseif openai_type == 'array' and array_description_lifted %}
                    {%- set final_description = array_description_lifted %}
                {# Priority 4: Default for simplified anyOf (if not overridden and node lacked one) #}
                {%- elseif is_complex_anyof %}
                    {%- set final_description = "Represents a flexible data structure (e.g., JSON)." %}
                {%- endif %}
                {# Output determined description if found AND if not currently processing an item schema OR if it's a complex anyOf item schema #}
                {# *** ADJUSTED OUTPUT CONDITION *** #}
                {%- if final_description and (not is_item_schema or is_complex_anyof) %}
                    ,"description": {{ final_description|json_encode|raw }}
                {%- endif %}
                {# --- Format --- #}
                {%- if schema.format is defined and schema.format and openai_type == 'string' %}
                     ,"format": {{ schema.format|json_encode|raw }}
                {%- endif %}
                {# --- Enum --- #}
                {%- if schema.enum is defined and schema.enum is iterable and (openai_type == 'string' or openai_type == 'number') %}
                    ,"enum": {{ schema.enum|json_encode|raw }}
                {%- endif %}
                {# --- Array Items --- #}
                {%- if openai_type == 'array' %}
                    {%- set item_schema_source = null %}
                    {%- if schema.items is defined %}
                        {%- if schema.items.anyOf is defined and schema.items.anyOf is iterable and schema.items.anyOf|length > 1 %}
                            {%- set item_schema_source = schema.items.anyOf[1] %}
                        {%- else %}
                            {%- set item_schema_source = schema.items %}
                        {%- endif %}
                    {%- endif %}
                    {%- set item_schema_source = item_schema_source|default({'type': 'string'}) %}
                    {# Recursive call for items: pass null for top_level_desc, true for is_item_schema #}
                    ,"items": {{ _self.transform_schema(item_schema_source, null, true) }}
                {%- endif %}
                {# --- Object Properties --- #}
                {%- if openai_type == 'object' %}
                    {%- if not is_complex_anyof %}
                        {%- set nested_properties_exist = false %}
                        ,"properties": { {# Start properties object #}
                        {%- if schema.properties is defined and schema.properties is iterable and schema.properties|length > 0 %}
                            {%- for prop_name, prop_schema in schema.properties %}
                                {%- set nested_properties_exist = true %}
                                {# Recursive call for nested props: pass null for top_level_desc, false for is_item_schema #}
                                {# *** Pass the nested prop's description explicitly *** #}
                                {{ prop_name|json_encode|raw }}: {{ _self.transform_schema(prop_schema, prop_schema.description|default(null), false) }}{% if not loop.last %},{% endif %}
                            {%- endfor %}
                        {%- endif %}
                        } {# End properties object #}
                        {%- if nested_properties_exist %}
                            {%- set nested_required = [] %}
                            {%- if schema.required is defined and schema.required is iterable %}
                                {%- for req_item in schema.required %}
                                    {%- if schema.properties[req_item] is defined %}
                                        {%- set nested_required = nested_required|merge([req_item]) %}
                                    {%- endif %}
                                {%- endfor %}
                            {%- endif %}
                            {%- if nested_required|length > 0 %}
                                ,"required": {{ nested_required|json_encode|raw }}
                            {%- endif %}
                        {%- endif %}
                        {%- if schema.additionalProperties is defined %}
                            ,"additionalProperties": {{ schema.additionalProperties ? 'true' : 'false' }}
                        {%- endif %}
                    {%- endif %} {# End 'if not is_complex_anyof' #}
                {%- endif %}
            } {# --- End Schema JSON Object --- #}
            {%- endmacro %}
            
            {# --- Import the macro for use in this template --- #}
            {%- import _self as schema_transformer %}
            
            {# --- Start the main JSON array --- #}
            [
                {%- for tool in $var.mcp_tools %}
                    {# --- Basic Tool Structure --- #}
                    {
                        "type": "function",
                        "function": {
                            "name": {{ tool.name|json_encode|raw }},
                            "description": {{ tool.description|default('')|json_encode|raw }},
                            "parameters": {
                                "type": "object"
                                {# --- Process Properties using the macro --- #}
                                {%- set has_properties = tool.inputSchema is defined
                                    and tool.inputSchema.type == 'object'
                                    and tool.inputSchema.properties is defined
                                    and tool.inputSchema.properties is iterable
                                    and tool.inputSchema.properties|length > 0 %}
                                {# OpenAI requires the properties object, even if empty #}
                                ,"properties": {
                                    {%- if has_properties %}
                                        {%- for param_name, param_schema in tool.inputSchema.properties %}
                                            {# Pass description explicitly to the macro for top-level properties #}
                                            {%- set current_param_desc = param_schema.description|default(null) %}
                                            {{ param_name|json_encode|raw }}: {{ schema_transformer.transform_schema(param_schema, current_param_desc, false) }}{% if not loop.last %},{% endif %}
                                        {%- endfor %}
                                    {%- endif %}
                                } {# End properties object #}
                                {# --- Process Top-Level Required Array --- #}
                                {%- if has_properties %}
                                    {%- set top_level_required = [] %}
                                    {%- if tool.inputSchema.required is defined and tool.inputSchema.required is iterable %}
                                        {# Filter required against actual properties defined at this top level #}
                                        {%- for req_item in tool.inputSchema.required %}
                                            {%- if tool.inputSchema.properties[req_item] is defined %}
                                                {%- set top_level_required = top_level_required|merge([req_item]) %}
                                            {%- endif %}
                                        {%- endfor %}
                                    {%- endif %}
                                    {# Output the 'required' key only if the filtered list is not empty #}
                                    {%- if top_level_required|length > 0 %}
                                        ,"required": {{ top_level_required|json_encode|raw }}
                                    {%- endif %}
                                {%- endif %}
                            } {# End parameters object #}
                        } {# End function object #}
                    } {# End tool object #}
                    {# Add comma between tool objects if not the last one #}
                    {%- if not loop.last %},{% endif %}
                {%- endfor %} {# End loop over tools #}
            ]
            {# --- End the main JSON array --- #}
            """
        } as $openai_tools|json_decode
      
        !debug.stop {
          value = $mcp_tools
        }
      }
    }
  
    // 2. Contact ChatGPT and receive tool use / response instructions.
    group {
      stack {
        util.template_engine {
          value = """
            [
            {# Set a flag to track if a comma is needed before the next item #}
            {% set needs_comma = false %}
            
            {# Add System Message if provided via input (Always first if present) #}
            {% if $input.system_prompt is defined and $input.system_prompt is not empty %}
                { "role": "system", "content": "{{ $input.system_prompt|e('js') }}" }
                {% set needs_comma = true %} {# Next item needs a comma #}
            {% endif %}
            
            {# Add Previous Messages from Conversation History input #}
            {# Filter out any messages that have role 'system' from the history #}
            {% if $input.conversation is defined and $input.conversation is not empty %}
                {% for message in $input.conversation %}
                    {# ONLY include user and assistant messages from history #}
                    {% if message.role != 'system' %}
                        {# Add comma before this message if it's not the very first item overall #}
                        {% if needs_comma %}
                            ,
                        {% else %}
                            {# If no comma was needed, this is the first item being rendered, so set flag for subsequent items #}
                            {% set needs_comma = true %}
                        {% endif %}
                        { "role": "{{ message.role }}", "content": "{{ message.content|e('js') }}" }
                    {% endif %}
                {% endfor %}
            {% endif %}
            
            {# Add the Current User Query (Always the last message) #}
            {% if needs_comma %}
                ,
            {% endif %}
            { "role": "user", "content": "{{ $input.user_query|e('js') }}" }
            ]
            """
        } as $updated_conversation|json_decode
      
        api.request {
          url = "https://api.openai.com/v1/chat/completions"
          method = "POST"
          params = {}
            |set:"model":"gpt-4.1-mini"
            |set:"messages":($updated_conversation
              |!push:({}
                |set:"role":"system"
                |set:"content":"You are ChatGPT with tool usage. Respond to the users query in a friendly manner and use tools as directed and where makes sense."
              )
              |!push:({}
                |set:"role":"user"
                |set:"content":$input.user_query
              )
            )
            |set:"tools":$openai_tools
          headers = []
            |push:"Content-Type: application/json"
            |push:"Authorization: Bearer "~$env.openai_key
        } as $openai_tool_request
      }
    }
  
    // 3. Execute Tool and have ChatGPT respond to the results.
    group {
      stack {
        try_catch {
          try {
            ai.external.mcp.tool.run {
              url = $server_url
              bearer_token = $env.$request_auth_token
              connection_type = "sse"
              tool = $openai_tool_request.response.result.choices.0.message.tool_calls.0.function.name
              args = $openai_tool_request.response.result.choices.0.message.tool_calls.0.function.arguments|json_decode
            } as $tool_response|get:"content":null|get:"0":null|get:"text":null|json_decode
          
            api.request {
              url = "https://api.openai.com/v1/chat/completions"
              method = "POST"
              params = {}
                |set:"model":"gpt-4.1-mini"
                |set:"messages":([]
                  |push:({}
                    |set:"role":"system"
                    |set:"content":"""
                Review the response from the tool and explain it to the user.
                """
                  )
                  |push:({}
                    |set:"role":"user"
                    |set:"content":("""
                User Query: {query}
                
                Tool Args: {args}
                Tool Response: {tool}
                """
                      |replace:"query":$input.user_query
                      |replace:"args":($openai_tool_request.response.result.choices.0.message.tool_calls.0.function.arguments|json_encode)
                      |replace:"tool":($tool_response|json_encode)
                    )
                  )
                )
              headers = []
                |push:"Content-Type: application/json"
                |push:"Authorization: Bearer "~$env.openai_key
            } as $openai_response_to_tool_result
          }
        
          catch {
            return {
              value = {}
                |set:"assistant":$openai_tool_request.response.result.choices.0.message.content
                |set:"tool_response":{}
                |set:"tool_args":{}
            }
          }
        }
      }
    }
  }

  response = {
    assistant    : $openai_response_to_tool_result.response.result.choices.0.message.content
    tool_args    : $openai_tool_request.response.result.choices.0.message.tool_calls.0.function.arguments|json_decode
    tool_response: $tool_response
  }
}
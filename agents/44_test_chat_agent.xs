agent "Test Chat Agent" {
  canonical = "vEJslOFh"
  llm = {
    type            : "openai"
    system_prompt   : "You are a helpful AI Agent that completes tasks accurately. When you need additional information to complete a task, use the available tools. Always explain your reasoning and provide clear responses."
    max_steps       : 5
    prompt          : ""
    api_key         : ""
    model           : "gpt-5-mini"
    temperature     : 1
    reasoning_effort: ""
    baseURL         : ""
    headers         : ""
    organization    : ""
    project         : ""
    compatibility   : "strict"
  }

  tools = []
}
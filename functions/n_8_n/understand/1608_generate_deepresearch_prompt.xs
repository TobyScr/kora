function "n8n/understand/generate_deepresearch_prompt" {
  input {
    int intervention_id?
  }

  stack {
    // ERROR: The requested webhook "POST generate_deep_research" is not registered.
  
    db.schema RESEARCH_DEEPRESEARCH_PROMPTS {
      path = ""
    } as $RESEARCH_DEEPRESEARCH_PROMPTS
  
    api.request {
      url = "/webhook/generate_deep_research"
      method = "POST"
      params = {}
        |set:"xano_schema":$RESEARCH_DEEPRESEARCH_PROMPTS
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $api1
}
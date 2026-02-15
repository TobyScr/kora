function "n8n/understand/generate_single_persona" {
  input {
    int intervention_id?
  }

  stack {
    db.schema DEMOGRAPHICS {
      path = ""
    } as $DEMOGRAPHICS
  
    db.schema PSYCHOGRAPHICS {
      path = ""
    } as $PSYCHOGRAPHICS
  
    db.schema CONTEXT_MEDIA {
      path = ""
    } as $CONTEXT_BEHAVIORS
  
    api.request {
      url = "/webhook/generate_single_persona"
      method = "POST"
      params = {}
        |set:"schema_demographics":$DEMOGRAPHICS
        |set:"schema_psychographics":$PSYCHOGRAPHICS
        |set:"schema_context_behaviors":$CONTEXT_BEHAVIORS
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $api1
}
function "n8n/understand/generate_behavioural_objective" {
  input {
    int intervention_id?
  }

  stack {
    db.schema BEHAVIOURAL_OBJECTIVE_NEW {
      path = ""
    } as $schema
  
    api.request {
      url = "/webhook/behavior_objective"
      method = "POST"
      params = {}
        |set:"xano_schema":$schema
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $api1
}
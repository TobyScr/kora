function "n8n/understand/generate_system_map" {
  input {
    int intervention_id?
  }

  stack {
    db.schema SYSTEM_MAP {
      path = ""
    } as $schema_system_map
  
    api.request {
      url = "/webhook/generate_system_map"
      method = "POST"
      params = {}
        |set:"message":$schema_system_map
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $api1
}
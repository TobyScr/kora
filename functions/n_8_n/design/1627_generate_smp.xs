function "n8n/design/generate_smp" {
  input {
    int intervention_id?
  }

  stack {
    db.schema SM_PROPOSITION {
      path = ""
    } as $SM_PROPOSITION1
  
    api.request {
      url = "/webhook/generate_smp"
      method = "POST"
      params = {}
        |set:"xano_schema":$SM_PROPOSITION1
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
        |set:"xano_base_url":$env.base_url
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $SM_PROPOSITION1
}
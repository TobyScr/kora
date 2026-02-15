function "n8n/design/generate_gwtb" {
  input {
    int intervention_id?
  }

  stack {
    db.schema GET_WHO_TO_BY {
      path = ""
    } as $GET_WHO_TO_BY1
  
    api.request {
      url = "/webhook/generate_gwtb"
      method = "POST"
      params = {}
        |set:"xano_schema":$GET_WHO_TO_BY1
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $GET_WHO_TO_BY1
}
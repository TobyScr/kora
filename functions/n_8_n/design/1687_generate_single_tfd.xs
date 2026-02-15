function "n8n/design/generate_single_tfd" {
  input {
    int intervention_id?
  }

  stack {
    db.schema TFD_CARD {
      path = ""
    } as $TFD_CARD1
  
    api.request {
      url = "/webhook/generate_single_tfd"
      method = "POST"
      params = {}
        |set:"xano_schema":$TFD_CARD1
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $TFD_CARD1
}
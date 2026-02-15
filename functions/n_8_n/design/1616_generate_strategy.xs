function "n8n/design/generate_strategy" {
  input {
    int intervention_id?
  }

  stack {
    db.schema STRATEGY {
      path = ""
    } as $STRATEGY1
  
    api.request {
      url = "/webhook/generate_strategy"
      method = "POST"
      params = {}
        |set:"xano_schema":$STRATEGY1
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $STRATEGY1
}
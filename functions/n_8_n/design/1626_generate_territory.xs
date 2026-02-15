function "n8n/design/generate_territory" {
  input {
    int intervention_id?
  }

  stack {
    db.schema TERRITORY {
      path = ""
    } as $TERRITORY1
  
    api.request {
      url = "/webhook/generate_territory"
      method = "POST"
      params = {}
        |set:"xano_schema":$TERRITORY1
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $TERRITORY1
}
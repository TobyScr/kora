function "n8n/understand/generate_assumption_testing" {
  input {
    int intervention_id?
  }

  stack {
    db.schema ASSUMPTION {
      path = ""
    } as $ASSUMPTION1
  
    api.request {
      url = "/webhook/generate_assumption"
      method = "POST"
      params = {}
        |set:"xano_schema":$ASSUMPTION1
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $ASSUMPTION1
}
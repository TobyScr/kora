function "n8n/design/generate_cjm" {
  input {
    int intervention_id?
  }

  stack {
    db.schema JOURNEY_MAP {
      path = ""
    } as $CJM1
  
    db.query OS_JOURNEY_PHASE {
      return = {type: "list"}
    } as $OS_JOURNEY_PHASE1
  
    api.request {
      url = "/webhook/generate_cjm"
      method = "POST"
      params = {}
        |set:"xano_schema":$CJM1
        |set:"os_journey_phases":$OS_JOURNEY_PHASE1
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
        |set:"xano_base_url":$env.base_url
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $api1
}
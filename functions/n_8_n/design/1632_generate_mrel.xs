function "n8n/design/generate_mrel" {
  input {
    int intervention_id?
  }

  stack {
    db.schema MREL_INDICATORS {
      path = ""
    } as $MREL_INDICATORS1
  
    db.query OS_INDICATOR_TYPE {
      return = {type: "list"}
    } as $OS_INDICATOR_TYPE1
  
    api.request {
      url = "/webhook/generate_mrel"
      method = "POST"
      params = {}
        |set:"xano_schema":$MREL_INDICATORS1
        |set:"os_indicator_types":$OS_INDICATOR_TYPE1
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
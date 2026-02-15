function "n8n/design/generate_single_mrel" {
  input {
    int intervention_id?
    int os_indicator_type_id? {
      table = "OS_INDICATOR_TYPE"
    }
  }

  stack {
    db.schema MREL_INDICATORS {
      path = ""
    } as $MREL_INDICATORS
  
    db.query OS_INDICATOR_TYPE {
      where = $db.OS_INDICATOR_TYPE.id == $input.os_indicator_type_id
      return = {type: "list"}
      output = ["id"]
    } as $OS_INDICATOR_TYPE
  
    api.request {
      url = "/webhook/generate_single_mrel"
      method = "POST"
      params = {}
        |set:"xano_schema":$MREL_INDICATORS
        |set:"indicator_type":$OS_INDICATOR_TYPE
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
        |set:"xano_base_url":$env.base_url
        |set:"selected_indicator":$input.os_indicator_type_id
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $api1
}
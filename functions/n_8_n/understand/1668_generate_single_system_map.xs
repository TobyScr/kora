function "n8n/understand/generate_single_system_map" {
  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    db.schema SYSTEM_MAP {
      path = ""
    } as $SCHEMA_SYSTEM_MAP
  
    db.query SYSTEM_MAP {
      where = $db.SYSTEM_MAP.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $SYSTEM_MAP
  
    api.request {
      url = "/webhook/generate_single_challenge"
      method = "POST"
      params = {}
        |set:"message":$SCHEMA_SYSTEM_MAP
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
        |set:"existing":$SYSTEM_MAP
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $api1
}
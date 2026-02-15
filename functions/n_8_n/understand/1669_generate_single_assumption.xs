function "n8n/understand/generate_single_assumption" {
  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    // comment
  
    db.schema ASSUMPTION {
      path = ""
    } as $SCHEMA_ASSUMPTION
  
    db.query ASSUMPTION {
      where = $db.ASSUMPTION.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $ASSUMPTION
  
    api.request {
      url = "/webhook/generate_single_assumption"
      method = "POST"
      params = {}
        |set:"message":$SCHEMA_ASSUMPTION
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
        |set:"existing":$ASSUMPTION
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $api1
}
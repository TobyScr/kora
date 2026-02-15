function "n8n/understand/generate_single_behavioral_objective" {
  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    db.schema BEHAVIOURAL_OBJECTIVE_NEW {
      path = ""
    } as $SCHEMA_BEHAVIOURAL_OBJECTIVE_NEW
  
    db.query BEHAVIOURAL_OBJECTIVE_NEW {
      where = $db.BEHAVIOURAL_OBJECTIVE_NEW.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $BEHAVIOURAL_OBJECTIVE_NEW
  
    api.request {
      url = "/webhook/generate_single_objective"
      method = "POST"
      params = {}
        |set:"message":$SCHEMA_BEHAVIOURAL_OBJECTIVE_NEW
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
        |set:"existing":$BEHAVIOURAL_OBJECTIVE_NEW
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $api1
}
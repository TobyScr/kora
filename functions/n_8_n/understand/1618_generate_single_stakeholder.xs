function "n8n/understand/generate_single_stakeholder" {
  input {
    int intervention_id?
  }

  stack {
    db.schema STAKEHOLDERS {
      path = ""
    } as $schema_stakeholders
  
    db.query STAKEHOLDERS {
      where = $db.STAKEHOLDERS.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $STAKEHOLDERS1
  
    api.request {
      url = "/webhook/generate_single_stakeholder"
      method = "POST"
      params = {}
        |set:"message":$schema_stakeholders
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
        |set:"existing":$STAKEHOLDERS1
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $api1
}
function "n8n/design/generate_single_territory" {
  input {
    int intervention_id?
  }

  stack {
    db.schema TERRITORY {
      path = ""
    } as $SCHEMA_TERRITORY
  
    db.query TERRITORY {
      where = $db.TERRITORY.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $TERRITORY
  
    api.request {
      url = "/webhook/generate_single_territory"
      method = "POST"
      params = {}
        |set:"message":$SCHEMA_TERRITORY
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
        |set:"existing":$TERRITORY
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $api1
}
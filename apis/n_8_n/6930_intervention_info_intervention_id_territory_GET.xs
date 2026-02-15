// Query all TERRITORY records
query "intervention-info/{intervention_id}/territory" verb=GET {
  api_group = "n8n"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query TERRITORY {
      where = $db.TERRITORY.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $territory
  }

  response = $territory
}
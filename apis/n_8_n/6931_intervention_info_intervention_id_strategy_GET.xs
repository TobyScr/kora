// Query all STRATEGY records
query "intervention-info/{intervention_id}/strategy" verb=GET {
  api_group = "n8n"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query STRATEGY {
      where = $db.STRATEGY.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $strategy
  }

  response = $strategy
}
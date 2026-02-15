// Query all STRATEGY records
query "projects/{intervention_id}/behavioral-framing/strategy" verb=GET {
  api_group = "Strategy"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query STRATEGY {
      where = $db.STRATEGY.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $model
  }

  response = $model
  tags = ["v2", "strategy"]
}
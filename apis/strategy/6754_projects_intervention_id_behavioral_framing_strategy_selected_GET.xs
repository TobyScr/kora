// Query the selected STRATEGY record
query "projects/{intervention_id}/behavioral-framing/strategy_selected" verb=GET {
  api_group = "Strategy"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query STRATEGY {
      where = $db.STRATEGY.intervention_id == $input.intervention_id && $db.STRATEGY.selected == true
      return = {type: "single"}
    } as $model
  }

  response = $model
  tags = ["v2", "strategy"]
}
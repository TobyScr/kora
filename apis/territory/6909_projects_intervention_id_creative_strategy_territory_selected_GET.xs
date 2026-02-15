// Query selected TERRITORY record
query "projects/{intervention_id}/creative-strategy/territory_selected" verb=GET {
  api_group = "Territory"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query TERRITORY {
      where = $db.TERRITORY.intervention_id == $input.intervention_id && $db.TERRITORY.selected == true
      return = {type: "single"}
    } as $model
  }

  response = $model
  tags = ["v2", "territory"]
}
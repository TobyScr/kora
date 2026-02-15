// Query all ASSUMPTION records
query "projects/{intervention_id}/assumption-testing/assumption" verb=GET {
  api_group = "Assumption Testing"
  auth = "USER"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query ASSUMPTION {
      where = $db.ASSUMPTION.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $model
  }

  response = $model
  tags = ["v2", "assumption"]
}
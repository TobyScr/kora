// Get all MREL_INDICATORS records
query "projects/{intervention_id}/mrel-indicators" verb=GET {
  api_group = "MREL Indicators"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query MREL_INDICATORS {
      where = $db.MREL_INDICATORS.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $model
  }

  response = $model
  tags = ["v2", "mrel"]
}
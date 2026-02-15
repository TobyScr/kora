// Query all OASIS records
query "projects/{intervention_id}/documentation/oasis" verb=GET {
  api_group = "OASIS Plan"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query OASIS {
      where = $db.OASIS.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $model
  }

  response = $model
  tags = ["v2", "oasis"]
}
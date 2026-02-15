// Query the GET_WHO_TO_BY record related to the intervention
query "projects/{intervention_id}/behavioral-framing/gwtb" verb=GET {
  api_group = "GWTB"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query GET_WHO_TO_BY {
      where = $db.GET_WHO_TO_BY.intervention_id == $input.intervention_id
      return = {type: "single"}
    } as $model
  }

  response = $model
  tags = ["v2", "get_who_to_by"]
}
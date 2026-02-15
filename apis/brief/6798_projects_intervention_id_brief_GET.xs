// Given a intervention_id return the related BRIEF_OUTPUT record
query "projects/{intervention_id}/brief" verb=GET {
  api_group = "Brief"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query BRIEF_OUTPUT {
      where = $db.BRIEF_OUTPUT.intervention_id == $input.intervention_id
      return = {type: "single"}
    } as $BRIEF_OUTPUT1
  }

  response = $BRIEF_OUTPUT1
  tags = ["brief", "v2"]
}
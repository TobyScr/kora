query brief_by_intervention verb=GET {
  api_group = "Brief"

  input {
    int intervention_id
  }

  stack {
    db.query BRIEF_OUTPUT {
      where = $db.BRIEF_OUTPUT.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $model
  }

  response = $model
}
// Query selected BEHAVIOURAL_OBJECTIVE record
query "projects/{intervention_id}/behavioral-objective-new/selected" verb=GET {
  api_group = "Behavioural Objective"

  input {
    int intervention_id?
  }

  stack {
    db.query BEHAVIOURAL_OBJECTIVE_NEW {
      where = $db.BEHAVIOURAL_OBJECTIVE_NEW.intervention_id == $input.intervention_id && $db.BEHAVIOURAL_OBJECTIVE_NEW.is_selected == true
      return = {type: "single"}
    } as $behavioural_objective
  }

  response = $behavioural_objective
  tags = ["behavioral_objective", "v2"]
}
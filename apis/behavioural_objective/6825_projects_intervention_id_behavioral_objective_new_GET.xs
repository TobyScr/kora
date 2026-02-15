// Query all BEHAVIOURAL_OBJECTIVE records
query "projects/{intervention_id}/behavioral-objective-new" verb=GET {
  api_group = "Behavioural Objective"
  auth = "USER"

  input {
    int intervention_id?
  }

  stack {
    db.query BEHAVIOURAL_OBJECTIVE_NEW {
      where = $db.BEHAVIOURAL_OBJECTIVE_NEW.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $behavioural_objective
  }

  response = $behavioural_objective
  tags = ["behavioral_objective", "v2"]
}
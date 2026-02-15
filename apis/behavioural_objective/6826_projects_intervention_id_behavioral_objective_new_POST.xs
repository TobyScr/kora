// Add BEHAVIOURAL_OBJECTIVE record
query "projects/{intervention_id}/behavioral-objective-new" verb=POST {
  api_group = "Behavioural Objective"

  input {
    dblink {
      table = "BEHAVIOURAL_OBJECTIVE_NEW"
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Behavioural Objective"
      }
    } as $func2
  
    db.add BEHAVIOURAL_OBJECTIVE_NEW {
      data = {
        created_at     : "now"
        intervention_id: $input.intervention_id
        objective      : $input.objective
        is_selected    : false
      }
    } as $behavioural_objective
  }

  response = $behavioural_objective
  tags = ["behavioral_objective", "v2"]
}
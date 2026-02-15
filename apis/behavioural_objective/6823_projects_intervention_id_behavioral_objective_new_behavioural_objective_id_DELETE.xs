// Delete BEHAVIOURAL_OBJECTIVE record
query "projects/{intervention_id}/behavioral-objective-new/{behavioural_objective_id}" verb=DELETE {
  api_group = "Behavioural Objective"
  auth = "USER"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    uuid behavioural_objective_id {
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
  
    db.del BEHAVIOURAL_OBJECTIVE_NEW {
      field_name = "id"
      field_value = $input.behavioural_objective_id
    }
  }

  response = null
  tags = ["behavioral_objective", "v2"]
}
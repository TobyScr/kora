// Edit BEHAVIOURAL_OBJECTIVE record
query "projects/{intervention_id}/behavioral-objective-new/{behavioural_objective_id}" verb=PATCH {
  api_group = "Behavioural Objective"
  auth = "USER"

  input {
    uuid behavioural_objective_id
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
  
    db.query BEHAVIOURAL_OBJECTIVE_NEW {
      where = $db.BEHAVIOURAL_OBJECTIVE_NEW.id == $input.behavioural_objective_id && $db.BEHAVIOURAL_OBJECTIVE_NEW.intervention_id == $input.intervention_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Entity not found."
    }
  
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch BEHAVIOURAL_OBJECTIVE_NEW {
      field_name = "id"
      field_value = $input.behavioural_objective_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $behavioural_objective
  }

  response = $behavioural_objective
  tags = ["behavioral_objective", "v2"]
}
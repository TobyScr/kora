// Select a given Approach and deselect the other
query "projects/{intervention_id}/creative-strategy/approach/{option_id}/select" verb=POST {
  api_group = "Approach"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    uuid option_id {
      table = "OS_APPROACH_OPTIONS"
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    }
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Approach"
      }
    } as $func1
  
    db.query OS_APPROACH_OPTIONS {
      where = $db.OS_APPROACH_OPTIONS.id == $input.option_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Option not found"
    }
  
    db.add_or_edit APPROACH {
      field_name = "intervention_id"
      field_value = $input.intervention_id
      data = {selected_option_id: $input.option_id}
    } as $CREATIVE_APPROACH1
  }

  response = "success"
  tags = ["v2", "approach"]
}
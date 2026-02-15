// Select a BEHAVIOURAL_OBJECTIVE record
query "projects/{intervention_id}/behavioral-objective-new/{behavioral_objective_id}/select" verb=POST {
  api_group = "Behavioural Objective"
  auth = "USER"

  input {
    uuid behavioural_objective_id {
      table = "BEHAVIOURAL_OBJECTIVE_NEW"
    }
  
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Behavioural Objective"
      }
    }
  
    db.query BEHAVIOURAL_OBJECTIVE_NEW {
      where = $db.BEHAVIOURAL_OBJECTIVE_NEW.id == $input.behavioural_objective_id && $db.BEHAVIOURAL_OBJECTIVE_NEW.intervention_id == $input.intervention_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
    }
  
    db.query BEHAVIOURAL_OBJECTIVE_NEW {
      where = $db.BEHAVIOURAL_OBJECTIVE_NEW.intervention_id == $input.intervention_id && $db.BEHAVIOURAL_OBJECTIVE_NEW.id != $input.behavioural_objective_id && $db.BEHAVIOURAL_OBJECTIVE_NEW.is_selected == true
      return = {type: "single"}
      output = ["id"]
    } as $PREVIOUS_SELECTED
  
    conditional {
      if ($PREVIOUS_SELECTED != null) {
        db.edit BEHAVIOURAL_OBJECTIVE_NEW {
          field_name = "id"
          field_value = $PREVIOUS_SELECTED.id
          data = {is_selected: false}
          output = ["id"]
        } as $DESELECTED
      }
    }
  
    db.edit BEHAVIOURAL_OBJECTIVE_NEW {
      field_name = "id"
      field_value = $input.behavioural_objective_id
      data = {is_selected: true}
    } as $SELECTED
  }

  response = null
  tags = ["behavioral_objective", "v2"]
}
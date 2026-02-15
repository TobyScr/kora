// Select a given SMP and deselect the previous one
query "projects/{intervention_id}/creative-strategy/smp/{sm_proposition_id}/select" verb=POST {
  api_group = "SMP"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    uuid sm_proposition_id {
      table = "SM_PROPOSITION"
    }
  }

  stack {
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Single-Minded Proposition"
      }
    }
  
    db.query SM_PROPOSITION {
      where = $db.SM_PROPOSITION.intervention_id == $input.intervention_id && $db.SM_PROPOSITION.id == $input.sm_proposition_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Strategy not found."
    }
  
    db.query SM_PROPOSITION {
      where = $db.SM_PROPOSITION.id != $input.sm_proposition_id && $db.SM_PROPOSITION.intervention_id == $input.intervention_id && $db.SM_PROPOSITION.selected == true
      return = {type: "single"}
      output = ["id"]
    } as $PREVIOUS_SELECTED
  
    conditional {
      if ($PREVIOUS_SELECTED != null) {
        db.edit SM_PROPOSITION {
          field_name = "id"
          field_value = $PREVIOUS_SELECTED.id
          data = {selected: false}
          output = ["id"]
        } as $DESELECTED
      }
    }
  
    db.edit SM_PROPOSITION {
      field_name = "id"
      field_value = $input.sm_proposition_id
      data = {selected: true}
      output = ["id"]
    } as $SELECTED
  }

  response = "success"
  tags = ["v2", "smp"]
}
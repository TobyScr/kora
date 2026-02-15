// Delete SM_PROPOSITION record
query "projects/{intervention_id}/creative-strategy/smp/{sm_proposition_id}" verb=DELETE {
  api_group = "SMP"
  auth = "USER"

  input {
    uuid sm_proposition_id?
    int intervention_id {
      table = "INTERVENTION"
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
      error = "Intervention not found."
    }
  
    db.del SM_PROPOSITION {
      field_name = "id"
      field_value = $input.sm_proposition_id
    }
  }

  response = null
  tags = ["v2", "smp"]
}
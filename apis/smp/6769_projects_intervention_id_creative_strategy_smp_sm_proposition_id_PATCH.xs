// Edit SM_PROPOSITION record
query "projects/{intervention_id}/creative-strategy/smp/{sm_proposition_id}" verb=PATCH {
  api_group = "SMP"
  auth = "USER"

  input {
    uuid sm_proposition_id?
    dblink {
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
      error = "Intervention not found."
    }
  
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch SM_PROPOSITION {
      field_name = "id"
      field_value = $input.sm_proposition_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
  tags = ["v2", "smp"]
}
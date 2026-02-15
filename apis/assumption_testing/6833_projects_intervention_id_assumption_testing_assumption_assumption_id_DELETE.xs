// Delete ASSUMPTION record
query "projects/{intervention_id}/assumption-testing/assumption/{assumption_id}" verb=DELETE {
  api_group = "Assumption Testing"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    uuid assumption_id?
  }

  stack {
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Assumption Testing"
      }
    } as $func2
  
    db.query ASSUMPTION {
      where = $db.ASSUMPTION.intervention_id == $input.intervention_id && $db.ASSUMPTION.id == $input.assumption_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Entity not found."
    }
  
    db.del ASSUMPTION {
      field_name = "id"
      field_value = $input.assumption_id
    }
  }

  response = null
  tags = ["v2", "assumption"]
}
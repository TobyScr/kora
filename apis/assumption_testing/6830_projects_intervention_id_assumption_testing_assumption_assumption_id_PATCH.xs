// Edit ASSUMPTION record
query "projects/{intervention_id}/assumption-testing/assumption/{assumption_id}" verb=PATCH {
  api_group = "Assumption Testing"
  auth = "USER"

  input {
    uuid assumption_id?
    dblink {
      table = "ASSUMPTION"
    }
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
  
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch ASSUMPTION {
      field_name = "id"
      field_value = $input.assumption_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
  tags = ["v2", "assumption"]
}
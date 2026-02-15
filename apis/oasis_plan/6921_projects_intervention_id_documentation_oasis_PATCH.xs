// Edit OASIS record
query "projects/{intervention_id}/documentation/oasis" verb=PATCH {
  api_group = "OASIS Plan"
  auth = "USER"

  input {
    dblink {
      table = "OASIS"
      override = {intervention_id: {hidden: true}}
    }
  
    int intervention2_id {
      table = "INTERVENTION"
    }
  
    uuid? oasis_id?
  }

  stack {
    db.query OASIS {
      where = $db.OASIS.intervention_id == $input.intervention2_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Entity not found."
    }
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention2_id
        step           : "OASIS Plan"
      }
    }
  
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch OASIS {
      field_name = "id"
      field_value = $input.oasis_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
  tags = ["v2", "oasis"]
}
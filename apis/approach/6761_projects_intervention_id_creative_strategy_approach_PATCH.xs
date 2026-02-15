// Edit the given Approach option based on the type
query "projects/{intervention_id}/creative-strategy/approach" verb=PATCH {
  api_group = "Approach"
  auth = "USER"

  input {
    dblink {
      table = "OS_APPROACH_OPTIONS"
    }
  }

  stack {
    db.query OS_APPROACH_OPTIONS {
      where = $db.OS_APPROACH_OPTIONS.type == $input.type
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Option not found."
    }
  
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch OS_APPROACH_OPTIONS {
      field_name = "type"
      field_value = $input.type
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
  tags = ["v2", "approach"]
}
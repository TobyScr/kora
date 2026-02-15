// Edit a JOURNEY_MAP record
query "projects/{intervention_id}/campaign-journey/jm/{journey_map_id}" verb=PATCH {
  api_group = "Journey Map"
  auth = "USER"

  input {
    uuid journey_map_id?
    dblink {
      table = "JOURNEY_MAP"
      override = {journey_phase_id: {hidden: true}}
    }
  }

  stack {
    db.query JOURNEY_MAP {
      where = $db.JOURNEY_MAP.id == $input.journey_map_id && $db.JOURNEY_MAP.intervention_id == $input.intervention_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Entity not found."
    }
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Journey Map"
      }
    }
  
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch JOURNEY_MAP {
      field_name = "id"
      field_value = $input.journey_map_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
  tags = ["v2", "journey_map"]
}
// Create or edit GET_WHO_TO_BY record
query "projects/{intervention_id}/behavioral-framing/gwtb" verb=PATCH {
  api_group = "GWTB"

  input {
    dblink {
      table = "GET_WHO_TO_BY"
      override = {created_at: {hidden: true}, created_by: {hidden: true}}
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    }
  
    db.get GET_WHO_TO_BY {
      field_name = "intervention_id"
      field_value = $input.intervention_id
    } as $GET_WHO_TO_BY
  
    conditional {
      if ($GET_WHO_TO_BY == null) {
        db.add GET_WHO_TO_BY {
          data = {
            intervention_id: $input.intervention_id
            created_at     : "now"
            get            : $input.get
            who            : $input.who
            to             : $input.to
            by             : $input.by
          }
        } as $model
      }
    
      else {
        util.get_raw_input {
          encoding = "json"
          exclude_middleware = false
        } as $raw_input
      
        db.patch GET_WHO_TO_BY {
          field_name = "intervention_id"
          field_value = $input.intervention_id
          data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
        } as $model
      }
    }
  }

  response = $model
  tags = ["v2", "get_who_to_by"]
}
// Edit a MREL_INDICATORS record
query "projects/{intervention_id}/mrel-indicators/{mrel_indicators_id}" verb=PATCH {
  api_group = "MREL Indicators"
  auth = "USER"

  input {
    uuid mrel_indicators_id?
    dblink {
      table = "MREL_INDICATORS"
    }
  }

  stack {
    db.query MREL_INDICATORS {
      where = $db.MREL_INDICATORS.intervention_id == $input.intervention_id && $db.MREL_INDICATORS.id == $input.mrel_indicators_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
    }
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "MREL Indicators"
      }
    }
  
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch MREL_INDICATORS {
      field_name = "id"
      field_value = $input.mrel_indicators_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
  tags = ["v2", "mrel"]
}
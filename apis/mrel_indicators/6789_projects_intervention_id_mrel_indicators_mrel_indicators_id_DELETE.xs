// Delete a MREL_INDICATORS record
query "projects/{intervention_id}/mrel-indicators/{mrel_indicators_id}" verb=DELETE {
  api_group = "MREL Indicators"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    uuid mrel_indicators_id?
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
  
    db.del MREL_INDICATORS {
      field_name = "id"
      field_value = $input.mrel_indicators_id
    }
  }

  response = null
  tags = ["v2", "mrel"]
}
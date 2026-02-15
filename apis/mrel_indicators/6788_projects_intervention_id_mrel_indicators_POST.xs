// Add a MREL_INDICATORS record
query "projects/{intervention_id}/mrel-indicators" verb=POST {
  api_group = "MREL Indicators"

  input {
    dblink {
      table = "MREL_INDICATORS"
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    }
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "MREL Indicators"
      }
    }
  
    db.add MREL_INDICATORS {
      data = {
        indicator_type : $input.indicator_type
        intervention_id: $input.intervention_id
        indicator      : $input.indicator
        target         : $input.target
        data_source    : $input.data_source
        created_at     : "now"
      }
    } as $model
  }

  response = $model
  tags = ["v2", "mrel"]
}
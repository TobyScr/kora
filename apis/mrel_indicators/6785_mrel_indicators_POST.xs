query mrel_indicators verb=POST {
  api_group = "MREL Indicators"

  input {
    dblink {
      table = "MREL_INDICATORS"
    }
  }

  stack {
    db.add MREL_INDICATORS {
      data = {
        indicator_type   : $input.indicator_type
        intervention_id  : $input.intervention_id
        indicator        : $input.indicator
        target_type      : $input.target_type
        target           : $input.target_value
        data_source      : $input.data_source
        feasibility_notes: $input.feasibility_notes
      }
    } as $model
  }

  response = $model
}
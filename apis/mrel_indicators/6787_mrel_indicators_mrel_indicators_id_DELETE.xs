query "mrel_indicators/{mrel_indicators_id}" verb=DELETE {
  api_group = "MREL Indicators"

  input {
    uuid mrel_indicators_id?
  }

  stack {
    db.del MREL_INDICATORS {
      field_name = "id"
      field_value = $input.mrel_indicators_id
    }
  }

  response = null
}
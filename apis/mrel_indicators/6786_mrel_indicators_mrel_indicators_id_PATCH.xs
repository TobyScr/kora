query "mrel_indicators/{mrel_indicators_id}" verb=PATCH {
  api_group = "MREL Indicators"
  auth = "USER"

  input {
    uuid mrel_indicators_id?
    dblink {
      table = "MREL_INDICATORS"
    }
  }

  stack {
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
}
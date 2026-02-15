// Edit OS_STRATEGY_TYPE record
query "os_strategy_type/{os_strategy_type_id}" verb=PATCH {
  api_group = "Research"

  input {
    int os_strategy_type_id? filters=min:1
    dblink {
      table = "OS_STRATEGY_TYPE"
    }
  }

  stack {
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch OS_STRATEGY_TYPE {
      field_name = "id"
      field_value = $input.os_strategy_type_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $os_strategy_type
  }

  response = $os_strategy_type
}
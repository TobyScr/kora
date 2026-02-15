// Delete OS_STRATEGY_TYPE record.
query "os_strategy_type/{os_strategy_type_id}" verb=DELETE {
  api_group = "Research"

  input {
    int os_strategy_type_id? filters=min:1
  }

  stack {
    db.del OS_STRATEGY_TYPE {
      field_name = "id"
      field_value = $input.os_strategy_type_id
    }
  }

  response = null
}
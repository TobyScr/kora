// Get OS_STRATEGY_TYPE record
query "os_strategy_type/{os_strategy_type_id}" verb=GET {
  api_group = "Research"

  input {
    int os_strategy_type_id? filters=min:1
  }

  stack {
    db.get OS_STRATEGY_TYPE {
      field_name = "id"
      field_value = $input.os_strategy_type_id
    } as $os_strategy_type
  
    precondition ($os_strategy_type != null) {
      error_type = "notfound"
      error = "Not Found."
    }
  }

  response = $os_strategy_type
}
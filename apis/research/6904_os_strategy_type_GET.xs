// Query all OS_STRATEGY_TYPE records
query os_strategy_type verb=GET {
  api_group = "Research"

  input {
  }

  stack {
    db.query OS_STRATEGY_TYPE {
      return = {type: "list"}
    } as $os_strategy_type
  }

  response = $os_strategy_type
}
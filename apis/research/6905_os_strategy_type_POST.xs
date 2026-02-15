// Add OS_STRATEGY_TYPE record
query os_strategy_type verb=POST {
  api_group = "Research"

  input {
    dblink {
      table = "OS_STRATEGY_TYPE"
    }
  }

  stack {
    db.add OS_STRATEGY_TYPE {
      data = {created_at: "now"}
    } as $os_strategy_type
  }

  response = $os_strategy_type
}
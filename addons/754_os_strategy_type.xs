addon OS_STRATEGY_TYPE {
  input {
    int OS_STRATEGY_TYPE_id? {
      table = "OS_STRATEGY_TYPE"
    }
  }

  stack {
    db.query OS_STRATEGY_TYPE {
      where = $db.OS_STRATEGY_TYPE.id == $input.OS_STRATEGY_TYPE_id
      return = {type: "single"}
    }
  }
}
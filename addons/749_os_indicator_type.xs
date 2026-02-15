addon OS_INDICATOR_TYPE {
  input {
    int OS_INDICATOR_TYPE_id? {
      table = "OS_INDICATOR_TYPE"
    }
  }

  stack {
    db.query OS_INDICATOR_TYPE {
      where = $db.OS_INDICATOR_TYPE.id == $input.OS_INDICATOR_TYPE_id
      return = {type: "single"}
    }
  }
}
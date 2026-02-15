addon OS_SYSTEM_DYNAMICS {
  input {
    int OS_SYSTEM_DYNAMICS_id? {
      table = ""
    }
  }

  stack {
    db.query "" {
      where = $db.OS_SYSTEM_DYNAMICS.id == $input.OS_SYSTEM_DYNAMICS_id
      return = {type: "single"}
    }
  }
}
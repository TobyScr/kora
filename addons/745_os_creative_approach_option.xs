addon OS_CREATIVE_APPROACH_OPTION {
  input {
    uuid OS_CREATIVE_APPROACH_OPTIONS_id? {
      table = "OS_APPROACH_OPTIONS"
    }
  }

  stack {
    db.query OS_APPROACH_OPTIONS {
      where = $db.OS_APPROACH_OPTIONS.id == $input.OS_CREATIVE_APPROACH_OPTIONS_id
      return = {type: "single"}
    }
  }
}
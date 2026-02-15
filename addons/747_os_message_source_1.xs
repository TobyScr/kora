addon OS_MESSAGE_SOURCE_1 {
  input {
    int OS_MESSAGE_SOURCE_id? {
      table = "OS_MESSAGE_SOURCE"
    }
  }

  stack {
    db.query OS_MESSAGE_SOURCE {
      where = $db.OS_MESSAGE_SOURCE.id == $input.OS_MESSAGE_SOURCE_id
      return = {type: "single"}
    }
  }
}
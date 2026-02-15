addon event_type {
  input {
    int EVENT_TYPE_id? {
      table = "EVENT_TYPE"
    }
  }

  stack {
    db.query EVENT_TYPE {
      where = $db.EVENT_TYPE.id == $input.EVENT_TYPE_id
      return = {type: "single"}
    }
  }
}
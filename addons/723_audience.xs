addon AUDIENCE {
  input {
    int AUDIENCE_id? {
      table = "AUDIENCE"
    }
  }

  stack {
    db.query AUDIENCE {
      where = $db.AUDIENCE.id == $input.AUDIENCE_id
      return = {type: "single"}
    }
  }
}
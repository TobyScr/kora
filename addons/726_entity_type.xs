addon ENTITY_TYPE {
  input {
    int ENTITY_TYPE_id? {
      table = "ENTITY_TYPE"
    }
  }

  stack {
    db.query ENTITY_TYPE {
      where = $db.ENTITY_TYPE.id == $input.ENTITY_TYPE_id
      return = {type: "single"}
    }
  }
}
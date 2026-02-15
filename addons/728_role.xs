addon ROLE {
  input {
    int ROLE_id? {
      table = "ROLE"
    }
  }

  stack {
    db.query ROLE {
      where = $db.ROLE.id == $input.ROLE_id
      return = {type: "single"}
    }
  }
}
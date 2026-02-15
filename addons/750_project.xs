addon PROJECT {
  input {
    int PROJECT_id? {
      table = "PROJECT"
    }
  }

  stack {
    db.query PROJECT {
      where = $db.PROJECT.id == $input.PROJECT_id
      return = {type: "single"}
    }
  }
}
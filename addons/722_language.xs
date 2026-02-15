addon LANGUAGE {
  input {
    int LANGUAGE_id? {
      table = "LANGUAGE"
    }
  }

  stack {
    db.query LANGUAGE {
      where = $db.LANGUAGE.id == $input.LANGUAGE_id
      return = {type: "single"}
    }
  }
}
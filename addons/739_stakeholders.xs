addon STAKEHOLDERS {
  input {
    int STAKEHOLDERS_id? {
      table = "STAKEHOLDERS"
    }
  }

  stack {
    db.query STAKEHOLDERS {
      where = $db.STAKEHOLDERS.id == $input.STAKEHOLDERS_id
      return = {type: "single"}
    }
  }
}
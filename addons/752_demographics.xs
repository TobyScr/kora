addon DEMOGRAPHICS {
  input {
    uuid DEMOGRAPHICS_id? {
      table = "DEMOGRAPHICS"
    }
  }

  stack {
    db.query DEMOGRAPHICS {
      where = $db.DEMOGRAPHICS.id == $input.DEMOGRAPHICS_id
      return = {type: "single"}
    }
  }
}
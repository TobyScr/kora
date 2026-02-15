addon COUNTRY {
  input {
    int COUNTRY_id? {
      table = "COUNTRY"
    }
  }

  stack {
    db.query COUNTRY {
      where = $db.COUNTRY.id == $input.COUNTRY_id
      return = {type: "single"}
    }
  }
}
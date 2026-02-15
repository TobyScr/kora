addon PSYCHOGRAPHICS {
  input {
    uuid PSYCHOGRAPHICS_id? {
      table = "PSYCHOGRAPHICS"
    }
  }

  stack {
    db.query PSYCHOGRAPHICS {
      where = $db.PSYCHOGRAPHICS.id == $input.PSYCHOGRAPHICS_id
      return = {type: "single"}
    }
  }
}
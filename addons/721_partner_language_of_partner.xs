addon PARTNER_LANGUAGE_of_PARTNER {
  input {
    int partner_id? {
      table = "PARTNER"
    }
  }

  stack {
    db.query "" {
      where = $db.PARTNER_LANGUAGE.partner_id == $input.partner_id
      return = {type: "list"}
    }
  }
}
addon PARTNER_CONTACT_DETAIL {
  input {
    int PARTNER_CONTACT_DETAIL_id? {
      table = "PARTNER_CONTACT_DETAIL"
    }
  }

  stack {
    db.query PARTNER_CONTACT_DETAIL {
      where = $db.PARTNER_CONTACT_DETAIL.id == $input.PARTNER_CONTACT_DETAIL_id
      return = {type: "single"}
    }
  }
}
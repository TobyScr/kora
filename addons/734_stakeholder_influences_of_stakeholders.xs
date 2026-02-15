addon STAKEHOLDER_INFLUENCES_of_STAKEHOLDERS {
  input {
    int stakeholders_id? {
      table = "STAKEHOLDERS"
    }
  }

  stack {
    db.query "" {
      where = $db.STAKEHOLDER_INFLUENCES.stakeholders_id == $input.stakeholders_id
      return = {type: "list"}
    }
  }
}
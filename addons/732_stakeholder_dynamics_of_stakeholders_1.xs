addon STAKEHOLDER_DYNAMICS_of_STAKEHOLDERS_1 {
  input {
    int stakeholders_id? {
      table = "STAKEHOLDERS"
    }
  }

  stack {
    db.query "" {
      where = $db.STAKEHOLDER_DYNAMICS.stakeholders_id == $input.stakeholders_id
      return = {type: "list"}
    }
  }
}
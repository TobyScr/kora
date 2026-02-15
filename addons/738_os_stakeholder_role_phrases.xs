addon OS_STAKEHOLDER_ROLE_PHRASES {
  input {
    int OS_STAKEHOLDER_ROLE_PHRASES_id? {
      table = "OS_STAKEHOLDER_ROLE_PHRASES"
    }
  }

  stack {
    db.query OS_STAKEHOLDER_ROLE_PHRASES {
      where = $db.OS_STAKEHOLDER_ROLE_PHRASES.id == $input.OS_STAKEHOLDER_ROLE_PHRASES_id
      return = {type: "single"}
    }
  }
}
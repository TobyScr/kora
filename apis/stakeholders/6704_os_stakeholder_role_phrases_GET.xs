query os_stakeholder_role_phrases verb=GET {
  api_group = "Stakeholders"
  auth = "USER"

  input {
    int stakeholder_role_id?
  }

  stack {
    db.query OS_STAKEHOLDER_ROLE_PHRASES {
      where = $db.OS_STAKEHOLDER_ROLE_PHRASES.os_stakeholder_types_id == $input.stakeholder_role_id
      return = {type: "list"}
    } as $model
  }

  response = $model
  tags = ["deprecated"]
}
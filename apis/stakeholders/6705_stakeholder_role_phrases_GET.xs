query stakeholder_role_phrases verb=GET {
  api_group = "Stakeholders"

  input {
  }

  stack {
    db.query OS_STAKEHOLDER_ROLE_PHRASES {
      return = {type: "list"}
    } as $OS_STAKEHOLDER_ROLE_PHRASES1
  }

  response = $OS_STAKEHOLDER_ROLE_PHRASES1
  tags = ["deprecated"]
}
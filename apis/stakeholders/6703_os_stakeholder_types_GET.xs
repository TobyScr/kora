query os_stakeholder_types verb=GET {
  api_group = "Stakeholders"

  input {
  }

  stack {
    db.query OS_STAKEHOLDER_TYPES {
      return = {type: "list"}
    } as $model
  }

  response = $model
}
addon STAKEHOLDERTYPES_TEST {
  input {
    int OS_STAKEHOLDER_TYPES_id? {
      table = "OS_STAKEHOLDER_TYPES"
    }
  }

  stack {
    db.query OS_STAKEHOLDER_TYPES {
      where = $db.OS_STAKEHOLDER_TYPES.id == $input.OS_STAKEHOLDER_TYPES_id
      return = {type: "single"}
    }
  }
}
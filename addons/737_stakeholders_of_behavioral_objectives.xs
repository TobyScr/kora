addon STAKEHOLDERS_of_BEHAVIORAL_OBJECTIVES {
  input {
    int STAKEHOLDERS_id? {
      table = "STAKEHOLDERS"
    }
  
    int stakeholder_types_id? {
      table = "OS_STAKEHOLDER_TYPES"
    }
  }

  stack {
    db.query STAKEHOLDERS {
      where = $db.STAKEHOLDERS.id == $input.STAKEHOLDERS_id && $db.STAKEHOLDERS.stakeholder_type_id == $input.stakeholder_types_id
      return = {type: "single"}
    }
  }
}
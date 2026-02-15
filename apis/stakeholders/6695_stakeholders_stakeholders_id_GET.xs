// Get STAKEHOLDERS record
query "stakeholders/{stakeholders_id}" verb=GET {
  api_group = "Stakeholders"

  input {
    int stakeholders_id? filters=min:1
  }

  stack {
    db.get STAKEHOLDERS {
      field_name = "id"
      field_value = $input.stakeholders_id
      addon = [
        {
          name  : "OS_STAKEHOLDER_TYPES"
          output: ["name"]
          input : {OS_STAKEHOLDER_TYPES_id: $output.stakeholder_type_id}
          as    : "_os_stakeholder_types"
        }
      ]
    } as $stakeholders
  
    precondition ($stakeholders != null) {
      error_type = "notfound"
      error = "Not Found."
    }
  }

  response = $stakeholders
  tags = ["deprecated"]
}
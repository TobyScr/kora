// Delete STAKEHOLDERS record.
query "stakeholders/{stakeholders_id}" verb=DELETE {
  api_group = "Stakeholders"

  input {
    int stakeholders_id? filters=min:1
  }

  stack {
    db.del STAKEHOLDERS {
      field_name = "id"
      field_value = $input.stakeholders_id
    }
  }

  response = "Success"
  tags = ["deprecated"]
}
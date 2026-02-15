query "research/{research_id}" verb=DELETE {
  api_group = "Research"
  auth = "USER"

  input {
    int research_id? filters=min:1
  }

  stack {
    db.del RESEARCH {
      field_name = "id"
      field_value = $input.research_id
    }
  }

  response = null
  tags = ["potentially inactive"]
}
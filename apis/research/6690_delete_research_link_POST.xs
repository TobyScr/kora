query delete_research_link verb=POST {
  api_group = "Research"
  auth = "USER"

  input {
    text research_id filters=trim
  }

  stack {
    db.del RESEARCH_Files_ {
      field_name = "id"
      field_value = $input.research_id
    }
  }

  response = "Link deleted"
  tags = ["potentially inactive"]
}
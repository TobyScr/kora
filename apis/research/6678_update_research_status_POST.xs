query update_research_status verb=POST {
  api_group = "Research"

  input {
    text result? filters=trim
    uuid? uuid?
  }

  stack {
    db.edit RESEARCH_Files_ {
      field_name = "id"
      field_value = $input.uuid
      data = {status: $input.result}
    } as $RESEARCH_Files1
  }

  response = $RESEARCH_Files1
  tags = ["potentially inactive"]
}
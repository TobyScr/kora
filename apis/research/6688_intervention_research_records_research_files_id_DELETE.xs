query "intervention_research_records/{research_files_id}" verb=DELETE {
  api_group = "Research"
  auth = "USER"

  input {
    uuid research_files_id?
  }

  stack {
    db.del RESEARCH_Files_ {
      field_name = "id"
      field_value = $input.research_files_id
    }
  }

  response = "success"
}
query "add_research_file_urls/{research_id}" verb=PATCH {
  api_group = "Research"
  auth = "USER"

  input {
    int research_id? filters=min:1
    dblink {
      table = "RESEARCH"
      override = {
        content                   : {hidden: true}
        is_skipped                : {hidden: true}
        is_confirmed              : {hidden: true}
        intervention_id           : {hidden: true}
        proprietary_links         : {hidden: true}
        proprietary_findings      : {hidden: true}
        research_sections_id      : {hidden: true}
        proprietary_uploaded_files: {hidden: true}
      }
    }
  }

  stack {
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch RESEARCH {
      field_name = "id"
      field_value = $input.research_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
  tags = ["potentially inactive"]
}
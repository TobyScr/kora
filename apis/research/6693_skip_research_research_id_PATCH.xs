query "skip-research/{research_id}" verb=PATCH {
  api_group = "Research"
  auth = "USER"

  input {
    int research_id? filters=min:1
    dblink {
      table = "RESEARCH"
      override = {
        content                   : {hidden: true}
        files_urls                : {hidden: true}
        proprietary_links         : {hidden: true}
        research_files_id         : {hidden: true}
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
}
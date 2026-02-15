// Updates a research url in the RESEARCH_Files_ table for the Existing Research section
query "projects/{intervention_id}/research/existing-research/add-link/{research_files_id}" verb=PATCH {
  api_group = "Research"
  auth = "USER"

  input {
    dblink {
      table = "RESEARCH_Files_"
      override = {
        file      : {hidden: true}
        type      : {hidden: true}
        value     : {hidden: true}
        status    : {hidden: true}
        txt_value : {hidden: true}
        created_at: {hidden: true}
        section_id: {hidden: true}
        subsection: {hidden: true}
      }
    }
  
    text url? filters=trim
    uuid research_files_id {
      table = "RESEARCH_Files_"
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    }
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Research Insights"
      }
    }
  
    db.query RESEARCH_Files_ {
      where = $db.RESEARCH_Files.id == $input.research_files_id && $db.RESEARCH_Files.intervention_id == $input.intervention_id && $db.RESEARCH_Files.type == "url" && $db.RESEARCH_Files.subsection == "existing"
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Entity not found."
    }
  
    db.edit RESEARCH_Files_ {
      field_name = "id"
      field_value = $input.research_files_id
      data = {txt_value: $input.url}
    }
  }

  response = "updated"
  tags = ["v2", "existing_research"]
}
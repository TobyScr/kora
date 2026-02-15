// Adds a research url in the RESEARCH_Files_ table for the Existing Research section
query "projects/{intervention_id}/research/existing-research/add-link" verb=POST {
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
        subsection: {hidden: true}
      }
    }
  
    text url? filters=trim
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
  
    db.query RESEARCH_SECTIONS {
      where = $db.RESEARCH_SECTIONS.id == $input.section_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Related Entity not found."
    }
  
    db.add RESEARCH_Files_ {
      data = {
        created_at     : "now"
        intervention_id: $input.intervention_id
        status         : "pending"
        type           : "url"
        subsection     : "existing"
        section_id     : $input.section_id
        txt_value      : $input.url
      }
    }
  }

  response = "updated"
  tags = ["v2", "existing_research"]
}
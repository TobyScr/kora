// Adds or Updates a research finding in the RESEARCH_Files_ table for the Existing Research section
query "projects/{intervention_id}/research/existing-research/add-finding" verb=POST {
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
  
    text findings? filters=trim
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
  
    db.query RESEARCH_Files_ {
      where = $db.RESEARCH_Files.intervention_id == $input.intervention_id && $db.RESEARCH_Files.type == "findings" && $db.RESEARCH_Files.subsection == "existing"
      return = {type: "single"}
      output = ["id"]
    } as $EXISTING
  
    conditional {
      if ($EXISTING == null) {
        db.add RESEARCH_Files_ {
          data = {
            created_at     : "now"
            intervention_id: $input.intervention_id
            status         : "pending"
            type           : "findings"
            subsection     : "existing"
            section_id     : $input.section_id
            txt_value      : $input.findings
          }
        }
      }
    
      else {
        db.edit RESEARCH_Files_ {
          field_name = "id"
          field_value = $EXISTING.id
          data = {txt_value: $input.findings}
        }
      }
    }
  }

  response = "updated"
  tags = ["v2", "existing_research"]
  docs = """
    Adds a Research finding related to a given intervention
    
    If research_file_id is given, it only updates the txt_value of the given RESEARCH_Files entry
    """
}
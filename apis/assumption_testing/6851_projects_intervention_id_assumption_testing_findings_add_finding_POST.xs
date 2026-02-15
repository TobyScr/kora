// Adds or Updates a assumption finding in the RESEARCH_Files_ table for the Assumption Testing section
query "projects/{intervention_id}/assumption-testing/findings/add-finding" verb=POST {
  api_group = "Assumption Testing"
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
  
    text findings? filters=trim
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    }
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Assumption Testing"
      }
    }
  
    db.query RESEARCH_Files_ {
      where = $db.RESEARCH_Files.intervention_id == $input.intervention_id && $db.RESEARCH_Files.type == "findings" && $db.RESEARCH_Files.subsection == "findings"
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
            subsection     : "findings"
            txt_value      : $input.findings
          }
        
          output = [
            "id"
            "created_at"
            "intervention_id"
            "status"
            "type"
            "subsection"
            "value"
            "txt_value"
            "file.access"
            "file.path"
            "file.name"
            "file.type"
            "file.size"
            "file.mime"
            "file.meta"
            "file.url"
          ]
        }
      }
    
      else {
        db.edit RESEARCH_Files_ {
          field_name = "id"
          field_value = $EXISTING.id
          data = {txt_value: $input.findings}
          output = [
            "id"
            "created_at"
            "intervention_id"
            "status"
            "type"
            "subsection"
            "value"
            "txt_value"
            "file.access"
            "file.path"
            "file.name"
            "file.type"
            "file.size"
            "file.mime"
            "file.meta"
            "file.url"
          ]
        }
      }
    }
  }

  response = "updated"
  tags = ["v2", "assumption_finding"]
  docs = """
    Adds a Research finding related to a given intervention
    
    If research_file_id is given, it only updates the txt_value of the given RESEARCH_Files entry
    """
}
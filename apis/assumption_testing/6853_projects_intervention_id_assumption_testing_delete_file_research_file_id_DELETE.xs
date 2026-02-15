// Deletes a file entry from the RESEARCH_Files_ table for the Assumption Testing section
query "projects/{intervention_id}/assumption-testing/delete-file/{research_file_id}" verb=DELETE {
  api_group = "Assumption Testing"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    uuid research_file_id {
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
        step           : "Assumption Testing"
      }
    }
  
    db.query RESEARCH_Files_ {
      where = $db.RESEARCH_Files.intervention_id == $input.intervention_id && $db.RESEARCH_Files.id == $input.research_file_id && $db.RESEARCH_Files.type == "file" && $db.RESEARCH_Files.subsection == "findings"
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Entity not found."
    }
  
    db.del RESEARCH_Files_ {
      field_name = "id"
      field_value = $input.research_file_id
    }
  }

  response = null
  tags = ["v2", "assumption_finding"]
}
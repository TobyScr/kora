// Updates the status of a given RESEARCH_Files_ entry
query "projects/{intervention_id}/research/update-status" verb=PATCH {
  api_group = "Research"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    uuid research_files_id {
      table = "RESEARCH_Files_"
    }
  
    text result? filters=trim
  }

  stack {
    db.query RESEARCH_Files_ {
      where = $db.RESEARCH_Files.intervention_id == $input.intervention_id && $db.RESEARCH_Files.id == $input.research_files_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Related Entity not found."
    }
  
    db.edit RESEARCH_Files_ {
      field_name = "id"
      field_value = $input.research_files_id
      data = {status: $input.result}
    } as $RESEARCH_Files1
  }

  response = $RESEARCH_Files1
  tags = ["deep_research", "existing_research", "v2"]
}
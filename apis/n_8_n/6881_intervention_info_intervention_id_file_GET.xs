query "intervention-info/{intervention_id}/file" verb=GET {
  api_group = "n8n"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    uuid? file_id?
  }

  stack {
    db.get INTERVENTION {
      field_name = "id"
      field_value = $input.intervention_id
    } as $INTERVENTION
  
    precondition ($INTERVENTION != null) {
      error_type = "notfound"
      error = "Intervention not found"
    }
  
    db.query STEP_CONFIRMATION_LOG {
      where = $db.STEP_CONFIRMATION_LOG.intervention_id == $input.intervention_id
      return = {type: "list"}
      output = ["step_id"]
      addon = [
        {
          name  : "WORKFLOW_STEP"
          output: ["name"]
          input : {WORKFLOW_STEP_id: $output.step_id}
        }
      ]
    } as $confirmed_steps|get:"name":null|safe_array|filter_empty:""
  
    db.query RESEARCH_Files_ {
      where = $db.RESEARCH_Files.id == $input.file_id
      return = {type: "list"}
    } as $RESEARCH_FILE
  }

  response = $RESEARCH_FILE
}
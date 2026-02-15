query "intervention-info/{intervention_id}/research" verb=GET {
  api_group = "n8n"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
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
  
    var $intervention_info {
      value = {}
    }
  
    // Understand
    group {
      stack {
        function.run "n8n/Intervention Info/Get confirmed Brief info" {
          input = {
            intervention_id  : $input.intervention_id
            intervention_info: $intervention_info
            confirmed_steps  : $confirmed_steps
          }
        } as $intervention_info
      
        function.run "n8n/Intervention Info/Get Research Document Insights" {
          input = {
            intervention_id  : $input.intervention_id
            intervention_info: $intervention_info
          }
        } as $intervention_info
      }
    }
  }

  response = $intervention_info
}
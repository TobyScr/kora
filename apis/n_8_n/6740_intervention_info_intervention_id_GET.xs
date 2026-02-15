query "intervention-info/{intervention_id}" verb=GET {
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
      
        function.run "n8n/Intervention Info/Get confirmed Research Insights" {
          input = {
            intervention_id  : $input.intervention_id
            intervention_info: $intervention_info
            confirmed_steps  : $confirmed_steps
          }
        } as $intervention_info
      
        function.run "n8n/Intervention Info/Get confirmed System Map" {
          input = {
            intervention_id  : $input.intervention_id
            intervention_info: $intervention_info
            confirmed_steps  : $confirmed_steps
          }
        } as $intervention_info
      
        function.run "n8n/Intervention Info/Get confirmed Behavioural Objective" {
          input = {
            intervention_id  : $input.intervention_id
            intervention_info: $intervention_info
            confirmed_steps  : $confirmed_steps
          }
        } as $intervention_info
      
        function.run "n8n/Intervention Info/Get confirmed Assumption Testing" {
          input = {
            intervention_id  : $input.intervention_id
            intervention_info: $intervention_info
            confirmed_steps  : $confirmed_steps
          }
        } as $intervention_info
      
        function.run "n8n/Intervention Info/Get confirmed COM-B" {
          input = {
            intervention_id  : $input.intervention_id
            intervention_info: $intervention_info
            confirmed_steps  : $confirmed_steps
          }
        } as $intervention_info
      
        function.run "n8n/Intervention Info/Get confirmed Personas" {
          input = {
            intervention_id  : $input.intervention_id
            intervention_info: $intervention_info
            confirmed_steps  : $confirmed_steps
          }
        } as $intervention_info
      }
    }
  
    // Design
    group {
      stack {
        function.run "n8n/Intervention Info/Get confirmed ThinkFeelDo info" {
          input = {
            intervention_id  : $input.intervention_id
            intervention_info: $intervention_info
            confirmed_steps  : $confirmed_steps
          }
        } as $intervention_info
      
        function.run "n8n/Intervention Info/Get confirmed Strategy info" {
          input = {
            intervention_id  : $input.intervention_id
            intervention_info: $intervention_info
            confirmed_steps  : $confirmed_steps
          }
        } as $intervention_info
      
        function.run "n8n/Intervention Info/Get confirmed GetWhoToBy info" {
          input = {
            intervention_id  : $input.intervention_id
            intervention_info: $intervention_info
            confirmed_steps  : $confirmed_steps
          }
        } as $intervention_info
      
        function.run "n8n/Intervention Info/Get confirmed Approach" {
          input = {
            intervention_id  : $input.intervention_id
            intervention_info: $intervention_info
            confirmed_steps  : $confirmed_steps
          }
        } as $intervention_info
      
        function.run "n8n/Intervention Info/Get confirmed Territory info" {
          input = {
            intervention_id  : $input.intervention_id
            intervention_info: $intervention_info
            confirmed_steps  : $confirmed_steps
          }
        } as $intervention_info
      
        function.run "n8n/Intervention Info/Get confirmed SMP info" {
          input = {
            intervention_id  : $input.intervention_id
            intervention_info: $intervention_info
            confirmed_steps  : $confirmed_steps
          }
        } as $intervention_info
      
        function.run "n8n/Intervention Info/Get confirmed Narrative Framework info" {
          input = {
            intervention_id  : $input.intervention_id
            intervention_info: $intervention_info
            confirmed_steps  : $confirmed_steps
          }
        } as $intervention_info
      
        function.run "n8n/Intervention Info/Get confirmed Core CTA" {
          input = {
            intervention_id  : $input.intervention_id
            intervention_info: $intervention_info
            confirmed_steps  : $confirmed_steps
          }
        } as $intervention_info
      
        function.run "n8n/Intervention Info/Get confirmed Journey Map" {
          input = {
            intervention_id  : $input.intervention_id
            intervention_info: $intervention_info
            confirmed_steps  : $confirmed_steps
          }
        } as $intervention_info
      
        function.run "n8n/Intervention Info/Get confirmed MREL Indicator info" {
          input = {
            intervention_id  : $input.intervention_id
            intervention_info: $intervention_info
            confirmed_steps  : $confirmed_steps
          }
        } as $intervention_info
      
        function.run "n8n/Intervention Info/Get confirmed CBD info" {
          input = {
            intervention_id  : $input.intervention_id
            intervention_info: $intervention_info
            confirmed_steps  : $confirmed_steps
          }
        } as $intervention_info
      
        function.run "n8n/Intervention Info/Get confirmed OASIS Plan info" {
          input = {
            intervention_id  : $input.intervention_id
            intervention_info: $intervention_info
            confirmed_steps  : $confirmed_steps
          }
        } as $intervention_info
      }
    }
  }

  response = $intervention_info
}
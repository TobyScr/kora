function "n8n/ai_generation_router" {
  input {
    int intervention_id?
    int confirmed_step?
    int step_log_id?
  }

  stack {
    db.get WORKFLOW_STEP {
      field_name = "id"
      field_value = $input.confirmed_step
    } as $confirmed_step1
  
    !precondition ($confirmed_step1.triggers != 0)
    conditional {
      if ($confirmed_step1.triggers != 0) {
        db.get WORKFLOW_STEP {
          field_name = "id"
          field_value = $confirmed_step1.triggers
        } as $triggered_step
      
        var $url {
          value = `$env.base_url|concat: ":"|concat: $env.$datasource|concat: "/"|concat: $var.triggered_step.ai_slug  `
        }
      
        api.request {
          url = $url
          method = "POST"
          params = {}
            |set:"intervention_id":$input.intervention_id
          headers = []
            |push:`"X-Data-Source"|concat: ":"|concat: $env.$datasource`
        } as $api1
      
        var $workflow_result {
          value = $api1.response.status
        }
      
        db.add ai_execution_log {
          data = {
            created_at              : "now"
            step_confirmation_log_id: $input.step_log_id
            status                  : $workflow_result
            n8n_triggered_workflow  : $triggered_step.ai_slug
            action                  : "started"
            intervention_id         : $input.intervention_id
          }
        } as $ai_router_log1
      }
    
      else {
        var $workflow_result {
          value = 200
        }
      }
    }
  }

  response = $workflow_result
}
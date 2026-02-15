query step_confirmation_log verb=POST {
  api_group = "Step Confirmation Logs"
  auth = "USER"

  input {
    dblink {
      table = "STEP_CONFIRMATION_LOG"
    }
  }

  stack {
    db.add STEP_CONFIRMATION_LOG {
      data = {
        confirmed_at   : "now"
        intervention_id: $input.intervention_id
        step_id        : $input.step_id
        user_id        : $input.user_id
      }
    } as $model
  
    function.run "n8n/ai_generation_router" {
      input = {
        intervention_id: $input.intervention_id
        confirmed_step : $input.step_id
        step_log_id    : $model.id
      }
    } as $func1
  
    function.run "Utils/Update Intervention progress percentage" {
      input = {intervention_id: $input.intervention_id}
    }
  }

  response = $model
}
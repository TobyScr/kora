query n8n_exection_log verb=POST {
  api_group = "n8n"

  input {
    dblink {
      table = "ai_execution_log"
      override = {
        created_at              : {hidden: true}
        step_confirmation_log_id: {hidden: true}
      }
    }
  }

  stack {
    db.add ai_execution_log {
      data = {
        created_at            : "now"
        status                : $input.status
        n8n_execution_id      : $input.n8n_execution_id
        n8n_triggered_workflow: $input.n8n_triggered_workflow
        action                : $input.action
        intervention_id       : $input.intervention_id
        message               : $input.message
        n8n_request_url       : $input.n8n_request_url
      }
    } as $ai_execution_log1
  }

  response = $ai_execution_log1
}
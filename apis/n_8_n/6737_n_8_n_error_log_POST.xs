query n8n_error_log verb=POST {
  api_group = "n8n"

  input {
    dblink {
      table = "N8N_ERROR_LOG"
    }
  }

  stack {
    db.add N8N_ERROR_LOG {
      data = {
        created_at        : "now"
        workflow_name     : $input.workflow_name
        error_message     : $input.error_message
        execution_id      : $input.execution_id
        workflow_id       : $input.workflow_id
        execution_url     : $input.execution_url
        last_node_executed: $input.last_node_executed
      }
    } as $N8N_ERROR_LOG1
  }

  response = "logged"
}
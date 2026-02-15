query n8n_error_log verb=GET {
  api_group = "n8n"
  auth = "USER"

  input {
  }

  stack {
    db.query N8N_ERROR_LOG {
      return = {type: "list"}
    } as $N8N_ERROR_LOG1
  }

  response = $N8N_ERROR_LOG1
}
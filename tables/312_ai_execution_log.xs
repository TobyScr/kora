table ai_execution_log {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    int step_confirmation_log_id? {
      table = "STEP_CONFIRMATION_LOG"
    }
  
    text status? filters=trim
    text n8n_execution_id? filters=trim
    text n8n_triggered_workflow? filters=trim
    text action? filters=trim
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    text message? filters=trim
    text n8n_request_url? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]
}
table N8N_ERROR_LOG {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    text workflow_name? filters=trim
    text error_message? filters=trim
    int execution_id?
    text workflow_id?
    text execution_url? filters=trim
    text last_node_executed? filters=trim
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]
}
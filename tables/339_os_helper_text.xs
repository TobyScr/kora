table OS_HELPER_TEXT {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    text text? filters=trim
    int workflow_step_id? {
      table = "WORKFLOW_STEP"
    }
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]
}
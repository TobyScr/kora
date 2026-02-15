query all_workflow_steps verb=GET {
  api_group = "Workflow Step"
  auth = "USER"

  input {
  }

  stack {
    db.query WORKFLOW_STEP {
      return = {type: "list"}
    } as $model
  }

  response = $model
}
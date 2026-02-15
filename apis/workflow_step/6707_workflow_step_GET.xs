query workflow_step verb=GET {
  api_group = "Workflow Step"
  auth = "USER"

  input {
    int? parent_step_id?
  }

  stack {
    db.query WORKFLOW_STEP {
      where = $db.WORKFLOW_STEP.parent_id == $input.parent_step_id
      return = {type: "list"}
      addon = [
        {
          name  : "WORKFLOW_STEP"
          output: ["id", "name", "level", "order", "id2"]
          input : {WORKFLOW_STEP_id: $output.parent_id}
          as    : "parent_workflow_step"
        }
      ]
    } as $model
  }

  response = $model
}
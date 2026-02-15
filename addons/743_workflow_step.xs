addon WORKFLOW_STEP {
  input {
    int WORKFLOW_STEP_id? {
      table = "WORKFLOW_STEP"
    }
  }

  stack {
    db.query WORKFLOW_STEP {
      where = $db.WORKFLOW_STEP.id == $input.WORKFLOW_STEP_id
      return = {type: "single"}
    }
  }
}
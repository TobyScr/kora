query step_confirmation_log verb=GET {
  api_group = "Step Confirmation Logs"
  auth = "USER"

  input {
    int intervention_id?
  }

  stack {
    db.query STEP_CONFIRMATION_LOG {
      where = $db.STEP_CONFIRMATION_LOG.intervention_id == $input.intervention_id
      return = {type: "list"}
      addon = [
        {
          name  : "WORKFLOW_STEP"
          output: ["order"]
          input : {WORKFLOW_STEP_id: $output.step_id}
          as    : "_workflow_step"
        }
      ]
    } as $model
  }

  response = $model
}
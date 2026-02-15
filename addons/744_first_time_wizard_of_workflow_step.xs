addon FIRST_TIME_WIZARD_of_WORKFLOW_STEP {
  input {
    int FIRST_TIME_WIZARD_id? {
      table = "FIRST_TIME_WIZARD"
    }
  
    int workflow_step_id? {
      table = "WORKFLOW_STEP"
    }
  }

  stack {
    db.query FIRST_TIME_WIZARD {
      where = $db.FIRST_TIME_WIZARD.id == $input.FIRST_TIME_WIZARD_id && $db.FIRST_TIME_WIZARD.workflow_step_id == $input.workflow_step_id
      return = {type: "single"}
    }
  }
}
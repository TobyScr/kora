query bulk_wizard_seen_logs verb=POST {
  api_group = "Wizard seen logs"
  auth = "USER"

  input {
    int[1:] step_ids?
    int user_id? {
      table = "USER"
    }
  }

  stack {
    foreach ($input.step_ids) {
      each as $step {
        db.add WIZARD_SEEN_LOGS {
          data = {
            created_at          : "now"
            first_time_wizard_id: $step
            user_id             : $input.user_id
          }
        } as $model
      }
    }
  
    db.query WIZARD_SEEN_LOGS {
      where = $db.WIZARD_SEEN_LOGS.user_id == $input.user_id
      return = {type: "list"}
    } as $WIZARD_SEEN_LOGS1
  }

  response = $WIZARD_SEEN_LOGS1
}
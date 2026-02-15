query wizard_seen_logs verb=POST {
  api_group = "Wizard seen logs"
  auth = "USER"

  input {
    dblink {
      table = "WIZARD_SEEN_LOGS"
    }
  }

  stack {
    db.add WIZARD_SEEN_LOGS {
      data = {
        created_at          : "now"
        first_time_wizard_id: $input.first_time_wizard_id
        user_id             : $input.user_id
      }
    } as $model
  }

  response = $model
}
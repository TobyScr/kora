query user_wizard_seen_logs verb=GET {
  api_group = "Wizard seen logs"
  auth = "USER"

  input {
    int user_id?
  }

  stack {
    db.query WIZARD_SEEN_LOGS {
      where = $db.WIZARD_SEEN_LOGS.user_id == $input.user_id
      return = {type: "list"}
    } as $model
  }

  response = $model
}
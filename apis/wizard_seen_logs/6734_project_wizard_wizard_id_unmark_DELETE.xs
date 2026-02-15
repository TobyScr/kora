query "project/wizard/{wizard_id}/unmark" verb=DELETE {
  api_group = "Wizard seen logs"
  auth = "USER"

  input {
    int wizard_id {
      table = "FIRST_TIME_WIZARD"
    }
  }

  stack {
    db.query FIRST_TIME_WIZARD {
      where = $db.FIRST_TIME_WIZARD.id == $input.wizard_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Wizard not found."
    }
  
    db.query WIZARD_SEEN_LOGS {
      where = $db.WIZARD_SEEN_LOGS.user_id == $auth.id && $db.WIZARD_SEEN_LOGS.first_time_wizard_id == $input.wizard_id
      return = {type: "single"}
      output = ["id"]
    } as $WIZARD_SEEN
  
    conditional {
      if ($WIZARD_SEEN != null) {
        db.del WIZARD_SEEN_LOGS {
          field_name = "id"
          field_value = $WIZARD_SEEN.id
        }
      }
    }
  }

  response = $FIRST_TIME_WIZARD1
}
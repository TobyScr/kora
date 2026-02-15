query "project/wizard/{wizard_id}/mark" verb=POST {
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
      return = {type: "exists"}
      output = ["id"]
    } as $WIZARD_SEEN_EXISTS
  
    conditional {
      if ($WIZARD_SEEN_EXISTS == false) {
        db.add WIZARD_SEEN_LOGS {
          data = {
            created_at          : "now"
            first_time_wizard_id: $input.wizard_id
            user_id             : $auth.id
          }
        } as $WIZARD_SEEN_LOGS1
      }
    }
  }

  response = $FIRST_TIME_WIZARD1
}
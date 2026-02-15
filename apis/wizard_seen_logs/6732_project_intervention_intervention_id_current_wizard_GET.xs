query "project/intervention/{intervention_id}/current-wizard" verb=GET {
  api_group = "Wizard seen logs"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.get INTERVENTION {
      field_name = "id"
      field_value = $input.intervention_id
      output = ["id", "current_step"]
    } as $INTERVENTION
  
    precondition ($INTERVENTION != null) {
      error_type = "notfound"
      error = "Intervention not found."
    }
  
    db.query FIRST_TIME_WIZARD {
      join = {
        WIZARD_SEEN_LOGS: {
          table: "WIZARD_SEEN_LOGS"
          type : "left"
          where: $db.WIZARD_SEEN_LOGS.first_time_wizard_id == $db.FIRST_TIME_WIZARD.id && $db.WIZARD_SEEN_LOGS.user_id == $auth.id
        }
      }
    
      where = $db.WIZARD_SEEN_LOGS.user_id == null && $db.FIRST_TIME_WIZARD.workflow_step_id == $INTERVENTION.current_step
      sort = {FIRST_TIME_WIZARD.order: "asc"}
      eval = {user: $db.WIZARD_SEEN_LOGS.user_id}
      return = {type: "single"}
      output = ["id", "created_at", "tip_name", "workflow_step_id", "order"]
    } as $WIZARD
  }

  response = $WIZARD
}
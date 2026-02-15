// Confirm the Narrative Framework section, validating that at least one Key Message exists
query "projects/{intervention_id}/narrative-framework/confirm" verb=POST {
  api_group = "Narrative Framework"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query KEY_MESSAGE {
      where = $db.KEY_MESSAGE.intervention_id == $input.intervention_id
      return = {type: "count"}
    } as $KEY_MESSAGE_COUNT
  
    precondition ($KEY_MESSAGE_COUNT >= 1) {
      error_type = "badrequest"
      error = "At least one message is required to confirm"
    }
  
    function.run "Utils/confirm_intervention_step" {
      input = {
        intervention_id: $input.intervention_id
        current_step   : "Narrative Framework"
        next_step      : "Core CTA"
      }
    } as $func1
  }

  response = null
  tags = ["v2", "narrative_framework"]
}
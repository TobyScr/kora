// Delete KEY_MESSAGE record
query "projects/{intervention_id}/narrative-framework/message/{key_message_id}" verb=DELETE {
  api_group = "Narrative Framework"
  auth = "USER"

  input {
    uuid key_message_id?
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Narrative Framework"
      }
    }
  
    db.query KEY_MESSAGE {
      where = $db.KEY_MESSAGE.id == $input.key_message_id && $db.KEY_MESSAGE.intervention_id == $input.intervention_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
    }
  
    db.query KEY_MESSAGE {
      where = $db.KEY_MESSAGE.intervention_id == $input.intervention_id
      return = {type: "count"}
    } as $count
  
    precondition ($count > 1) {
      error_type = "unauthorized"
      error = "There must be at least one key message."
    }
  
    db.del KEY_MESSAGE {
      field_name = "id"
      field_value = $input.key_message_id
    }
  }

  response = null
  tags = ["v2", "narrative_framework", "key_message"]
}
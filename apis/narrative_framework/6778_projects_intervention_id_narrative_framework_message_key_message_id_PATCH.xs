// Edit KEY_MESSAGE record
query "projects/{intervention_id}/narrative-framework/message/{key_message_id}" verb=PATCH {
  api_group = "Narrative Framework"
  auth = "USER"

  input {
    uuid key_message_id?
    dblink {
      table = "KEY_MESSAGE"
    }
  }

  stack {
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Narrative Framework"
      }
    } as $func2
  
    db.query KEY_MESSAGE {
      where = $db.KEY_MESSAGE.id == $input.key_message_id && $db.KEY_MESSAGE.intervention_id == $input.intervention_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
    }
  
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch KEY_MESSAGE {
      field_name = "id"
      field_value = $input.key_message_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
  tags = ["v2", "narrative_framework", "key_message"]
}
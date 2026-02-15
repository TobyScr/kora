query "intervention-info/{intervention_id}/key_messages" verb=GET {
  api_group = "n8n"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query KEY_MESSAGE {
      where = $db.KEY_MESSAGE.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $key_messages
  }

  response = $key_messages
}
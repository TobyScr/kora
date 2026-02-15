query os_message_source verb=GET {
  api_group = "Narrative Framework"
  auth = "USER"

  input {
  }

  stack {
    db.query OS_MESSAGE_SOURCE {
      return = {type: "list"}
    } as $model
  }

  response = $model
}
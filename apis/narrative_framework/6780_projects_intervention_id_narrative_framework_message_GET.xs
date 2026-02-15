// Query all KEY_MESSAGE records
query "projects/{intervention_id}/narrative-framework/message" verb=GET {
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
      return = {type: "list"}
    } as $model
  }

  response = $model
  tags = ["v2", "narrative_framework", "key_message"]
}
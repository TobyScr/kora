// Given a intervention_id return the related BRIEF_CHAT_OUTPUT
query "projects/{intervention_id}/brief_chat" verb=GET {
  api_group = "Brief"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query BRIEF_CHAT_OUTPUT {
      where = $db.BRIEF_CHAT_OUTPUT.intervention_id == $input.intervention_id
      return = {type: "single"}
    } as $BRIEF_CHAT_OUTPUT1
  }

  response = $BRIEF_CHAT_OUTPUT1
  tags = ["brief", "v2"]
}
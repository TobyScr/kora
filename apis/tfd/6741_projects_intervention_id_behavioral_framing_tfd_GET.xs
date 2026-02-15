// Query all TFD_CARD records for a given intervention
query "projects/{intervention_id}/behavioral-framing/tfd" verb=GET {
  api_group = "TFD"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query TFD_CARD {
      where = $db.TFD_CARD.intervention_id == $input.intervention_id
      return = {type: "list"}
      addon = [
        {
          name : "COM_B"
          input: {COM_B_id: $output.com_b1_id}
          as   : "com_b1"
        }
        {
          name : "COM_B"
          input: {COM_B_id: $output.com_b2_id}
          as   : "com_b2"
        }
      ]
    } as $model
  }

  response = $model
  tags = ["v2", "think_feel_do"]
}
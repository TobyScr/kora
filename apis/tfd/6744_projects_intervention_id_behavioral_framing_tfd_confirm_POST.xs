// Confirm the Think-Feel-Do section, if there is only one TFD card select it by default
query "projects/{intervention_id}/behavioral-framing/tfd/confirm" verb=POST {
  api_group = "TFD"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query TFD_CARD {
      where = $db.TFD_CARD.intervention_id == $input.intervention_id && $db.TFD_CARD.selected == true
      return = {type: "exists"}
    } as $EXISTS
  
    conditional {
      if ($EXISTS == false) {
        db.edit TFD_CARD {
          field_name = "intervention_id"
          field_value = $input.intervention_id
          data = {selected: true}
        } as $TFD_CARD1
      }
    }
  
    function.run "Utils/confirm_intervention_step" {
      input = {
        intervention_id: $input.intervention_id
        current_step   : "Think-Feel-Do"
        next_step      : "Strategy"
      }
    } as $func1
  }

  response = null
  tags = ["v2", "think_feel_do"]
}
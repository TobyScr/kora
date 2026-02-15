// Select a given TFD card and deselect the previous one
query "projects/{intervention_id}/behavioral-framing/tfd/{tfd_card_id}/select" verb=POST {
  api_group = "TFD"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    uuid tfd_card_id {
      table = "TFD_CARD"
    }
  }

  stack {
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Think-Feel-Do"
      }
    } as $func2
  
    db.query TFD_CARD {
      where = $db.TFD_CARD.id == $input.tfd_card_id && $db.TFD_CARD.intervention_id == $input.intervention_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
    }
  
    db.query TFD_CARD {
      where = $db.TFD_CARD.intervention_id == $input.intervention_id && $db.TFD_CARD.selected == true && $db.TFD_CARD.id != $input.tfd_card_id
      return = {type: "single"}
      output = ["id"]
    } as $PREVIOUS_SELECTED
  
    conditional {
      if ($PREVIOUS_SELECTED != null) {
        db.edit TFD_CARD {
          field_name = "id"
          field_value = $PREVIOUS_SELECTED.id
          data = {selected: false}
          output = ["id"]
        } as $DESELECTED
      }
    }
  
    db.edit TFD_CARD {
      field_name = "id"
      field_value = $input.tfd_card_id
      data = {selected: true}
      output = ["id"]
    } as $SELECTED
  }

  response = "success"
  tags = ["v2", "think_feel_do"]
}
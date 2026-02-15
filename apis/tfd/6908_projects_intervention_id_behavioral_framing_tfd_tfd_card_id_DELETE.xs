// Delete a given TFD card
query "projects/{intervention_id}/behavioral-framing/tfd/{tfd_card_id}" verb=DELETE {
  api_group = "TFD"
  auth = "USER"

  input {
    uuid tfd_card_id?
    int intervention_id {
      table = "INTERVENTION"
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
      error = "Card not found"
    }
  
    db.del TFD_CARD {
      field_name = "id"
      field_value = $input.tfd_card_id
    }
  }

  response = null
  tags = ["v2", "think_feel_do"]
}
// Update the content of a given TFD card
query "projects/{intervention_id}/behavioral-framing/tfd/{tfd_card_id}" verb=PATCH {
  api_group = "TFD"
  auth = "USER"

  input {
    uuid tfd_card_id?
    dblink {
      table = "TFD_CARD"
      override = {
        com_b_id  : {hidden: true}
        selected  : {hidden: true}
        created_at: {hidden: true}
      }
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
  
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch TFD_CARD {
      field_name = "id"
      field_value = $input.tfd_card_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
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
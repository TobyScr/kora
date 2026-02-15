function "n8n/Intervention Info/Get confirmed ThinkFeelDo info" {
  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    json intervention_info
    text[] confirmed_steps
  }

  stack {
    var $info {
      value = $input.intervention_info
    }
  
    conditional {
      if ($input.confirmed_steps|in:"Think-Feel-Do") {
        db.query TFD_CARD {
          where = $db.TFD_CARD.intervention_id == $input.intervention_id && $db.TFD_CARD.selected == true
          return = {type: "single"}
          output = [
            "com_b1_id"
            "com_b2_id"
            "current_think"
            "current_feel"
            "current_do"
            "future_think"
            "future_feel"
            "future_do"
          ]
        
          addon = [
            {
              name : "COM_B"
              input: {COM_B_id: $output.com_b1_id}
              as   : "com_b_1"
            }
            {
              name : "COM_B"
              input: {COM_B_id: $output.com_b2_id}
              as   : "com_b_2"
            }
          ]
        } as $TFD_CARD
      
        var.update $info {
          value = $info|set:"TFD_CARD":$TFD_CARD
        }
      }
    }
  }

  response = $info
}
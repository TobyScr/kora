function "n8n/Intervention Info/Get confirmed SMP info" {
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
      if ($input.confirmed_steps|in:"Single-Minded Proposition") {
        db.query SM_PROPOSITION {
          where = $db.SM_PROPOSITION.intervention_id == $input.intervention_id && $db.SM_PROPOSITION.selected == true
          return = {type: "single"}
          output = ["proposition"]
        } as $SM_PROPOSITION|get:"proposition":null
      
        var.update $info {
          value = $info
            |set:"SM_PROPOSITION":$SM_PROPOSITION
        }
      }
    }
  }

  response = $info
}
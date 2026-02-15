function "n8n/Intervention Info/Get confirmed System Map" {
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
      if ($input.confirmed_steps|in:"System Map") {
        db.query SYSTEM_MAP {
          where = $db.SYSTEM_MAP.intervention_id == $input.intervention_id && $db.SYSTEM_MAP.is_selected == true
          return = {type: "single"}
          output = ["challenge", "description"]
        } as $SYSTEM_MAP
      
        var.update $info {
          value = $info|set:"SYSTEM_MAP":$SYSTEM_MAP
        }
      }
    }
  }

  response = $info
}
function "n8n/Intervention Info/Get confirmed Strategy info" {
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
      if ($input.confirmed_steps|in:"Strategy") {
        db.query STRATEGY {
          where = $db.STRATEGY.intervention_id == $input.intervention_id && $db.STRATEGY.selected == true
          return = {type: "single"}
          output = ["strategy", "type", "description", "pros", "cons"]
        } as $STRATEGY
      
        var.update $info {
          value = $info|set:"STRATEGY":$STRATEGY
        }
      }
    }
  }

  response = $info
}
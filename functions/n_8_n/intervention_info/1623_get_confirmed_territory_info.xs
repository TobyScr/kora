function "n8n/Intervention Info/Get confirmed Territory info" {
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
      if ($input.confirmed_steps|in:"Territory") {
        db.query TERRITORY {
          where = $db.TERRITORY.intervention_id == $input.intervention_id && $db.TERRITORY.selected == true
          return = {type: "single"}
          output = ["title", "description", "credibility"]
        } as $TERRITORY
      
        var.update $info {
          value = $info|set:"TERRITORY":$TERRITORY
        }
      }
    }
  }

  response = $info
}
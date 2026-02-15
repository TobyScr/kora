function "n8n/Intervention Info/Get confirmed Behavioural Objective" {
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
      if ($input.confirmed_steps|in:"Behavioural Objective") {
        db.query BEHAVIOURAL_OBJECTIVE_NEW {
          where = $db.BEHAVIOURAL_OBJECTIVE_NEW.intervention_id == $input.intervention_id && $db.BEHAVIOURAL_OBJECTIVE_NEW.is_selected == true
          return = {type: "single"}
          output = ["objective"]
        } as $BEHAVIOURAL_OBJECTIVE|get:"objective":null
      
        var.update $info {
          value = $info
            |set:"BEHAVIOURAL_OBJECTIVE":$BEHAVIOURAL_OBJECTIVE
        }
      }
    }
  }

  response = $info
}
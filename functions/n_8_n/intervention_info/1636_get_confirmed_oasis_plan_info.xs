function "n8n/Intervention Info/Get confirmed OASIS Plan info" {
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
      if ($input.confirmed_steps|in:"OASIS Plan") {
        db.query OASIS {
          where = $db.OASIS.intervention_id == $input.intervention_id
          return = {type: "single"}
        } as $OASIS
      
        var.update $info {
          value = $info|set:"OASIS":$OASIS
        }
      }
    }
  }

  response = $info
}
function "n8n/Intervention Info/Get confirmed Core CTA" {
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
      if ($input.confirmed_steps|in:"Core CTA") {
        db.query CTA {
          where = $db.CTA.intervention_id == $input.intervention_id && $db.CTA.selected == true
          return = {type: "single"}
          output = ["title", "validations"]
        } as $CTA
      
        var.update $info {
          value = $info|set:"CORE_CTA":$CTA
        }
      }
    }
  }

  response = $info
}
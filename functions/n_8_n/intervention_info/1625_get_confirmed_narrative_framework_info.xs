function "n8n/Intervention Info/Get confirmed Narrative Framework info" {
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
      if ($input.confirmed_steps|in:"Narrative Framework") {
        db.query CORE_NARRATIVE {
          where = $db.CORE_NARRATIVE.intervention_id == $input.intervention_id
          return = {type: "list"}
          output = ["title", "narrative"]
        } as $CORE_NARRATIVE
      
        var.update $info {
          value = $info
            |set:"CORE_NARRATIVE":$CORE_NARRATIVE
        }
      
        db.query KEY_MESSAGE {
          where = $db.KEY_MESSAGE.intervention_id == $input.intervention_id
          return = {type: "list"}
          output = ["message", "proof_points"]
        } as $KEY_MESSAGE
      
        var.update $info {
          value = $info|set:"KEY_MESSAGE":$KEY_MESSAGE
        }
      }
    }
  }

  response = $info
}
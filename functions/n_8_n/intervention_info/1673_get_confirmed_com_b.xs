function "n8n/Intervention Info/Get confirmed COM-B" {
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
      if ($input.confirmed_steps|in:"COM-B") {
        db.query COM_B {
          where = $db.COM_B.intervention_id == $input.intervention_id && $db.COM_B.selected == true
          return = {type: "list"}
          output = ["id", "type", "barrier", "description"]
        } as $COM_B
      
        var.update $info {
          value = $info|set:"COM_B":$COM_B
        }
      }
    }
  }

  response = $info
}
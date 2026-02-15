function "n8n/Intervention Info/Get confirmed GetWhoToBy info" {
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
      if ($input.confirmed_steps|in:"Get-Who-To-By") {
        db.query GET_WHO_TO_BY {
          where = $db.GET_WHO_TO_BY.intervention_id == $input.intervention_id
          return = {type: "single"}
          output = ["get", "who", "to", "by"]
        } as $GET_WHO_TO_BY
      
        var.update $info {
          value = $info
            |set:"GET_WHO_TO_BY":$GET_WHO_TO_BY
        }
      }
    }
  }

  response = $info
}
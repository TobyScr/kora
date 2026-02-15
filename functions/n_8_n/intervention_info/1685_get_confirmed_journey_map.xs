function "n8n/Intervention Info/Get confirmed Journey Map" {
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
      if ($input.confirmed_steps|in:"Journey Map") {
        db.query JOURNEY_MAP {
          where = $db.JOURNEY_MAP.intervention_id == $input.intervention_id
          return = {type: "list"}
          output = ["key_moments", "key_messages", "key_mechanism"]
          addon = [
            {
              name  : "OS_JOURNEY_PHASE"
              output: ["name"]
              input : {OS_JOURNEY_PHASE_id: $output.journey_phase_id}
              as    : "phase"
            }
          ]
        } as $JOURNEY_MAP
      
        var.update $info {
          value = $info|set:"JOURNEY_MAP":$JOURNEY_MAP
        }
      }
    }
  }

  response = $info
}
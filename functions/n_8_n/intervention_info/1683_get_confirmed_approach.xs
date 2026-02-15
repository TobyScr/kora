function "n8n/Intervention Info/Get confirmed Approach" {
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
      if ($input.confirmed_steps|in:"Approach") {
        db.get APPROACH {
          field_name = "intervention_id"
          field_value = $input.intervention_id
          output = ["selected_option_id"]
          addon = [
            {
              name  : "OS_CREATIVE_APPROACH_OPTION"
              output: ["type", "description", "steps_outputs"]
              input : {
                OS_CREATIVE_APPROACH_OPTIONS_id: $output.selected_option_id
              }
            }
          ]
        } as $APPROACH
      
        var.update $info {
          value = $info|set:"APPROACH":$APPROACH
        }
      }
    }
  }

  response = $info
}
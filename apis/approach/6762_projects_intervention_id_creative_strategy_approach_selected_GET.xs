// Get the Approach selected for the given intervention
query "projects/{intervention_id}/creative-strategy/approach/selected" verb=GET {
  api_group = "Approach"
  auth = "USER"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    }
  
    db.get APPROACH {
      field_name = "intervention_id"
      field_value = $input.intervention_id
      addon = [
        {
          name  : "OS_CREATIVE_APPROACH_OPTION"
          output: ["type", "description", "steps_outputs"]
          input : {
            OS_CREATIVE_APPROACH_OPTIONS_id: $output.selected_option_id
          }
        }
      ]
    } as $model
  }

  response = $model
  tags = ["v2", "approach"]
}
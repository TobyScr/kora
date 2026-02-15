// Confirm the System Mapp section
query "projects/{intervention_id}/system-map/confirm" verb=POST {
  api_group = "System Map"
  auth = "USER"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    function.run "Utils/confirm_intervention_step" {
      input = {
        intervention_id: $input.intervention_id
        current_step   : "System Map"
        next_step      : "Behavioural Objective"
      }
    } as $func1
  }

  response = null
  tags = ["system_map", "v2"]
}
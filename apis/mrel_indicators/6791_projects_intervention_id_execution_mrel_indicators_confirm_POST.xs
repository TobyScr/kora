// Confirm the MREL Indicators section
query "projects/{intervention_id}/execution/mrel-indicators/confirm" verb=POST {
  api_group = "MREL Indicators"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    function.run "Utils/confirm_intervention_step" {
      input = {
        intervention_id: $input.intervention_id
        current_step   : "MREL Indicators"
        next_step      : "Creative Brief"
      }
    }
  }

  response = null
  tags = ["v2", "mrel"]
}
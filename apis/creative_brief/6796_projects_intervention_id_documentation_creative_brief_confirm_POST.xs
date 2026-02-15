// Confirm the Creative Brief section
query "projects/{intervention_id}/documentation/creative-brief/confirm" verb=POST {
  api_group = "Creative Brief"
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
        current_step   : "Creative Brief"
        next_step      : "OASIS Plan"
      }
    }
  }

  response = null
  tags = ["v2", "creative_brief"]
}
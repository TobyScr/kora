// Confirm the Core CTA section
query "projects/{intervention_id}/campaign-journey/cta/confirm" verb=POST {
  api_group = "Core CTA"
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
        current_step   : "Core CTA"
        next_step      : "Journey Map"
      }
    }
  }

  response = null
  tags = ["v2", "cta"]
}
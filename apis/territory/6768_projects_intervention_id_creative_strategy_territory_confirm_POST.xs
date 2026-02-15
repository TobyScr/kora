// Confirm the Territory section
query "projects/{intervention_id}/creative-strategy/territory/confirm" verb=POST {
  api_group = "Territory"
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
        current_step   : "Territory"
        next_step      : "Single-Minded Proposition"
      }
    } as $func1
  }

  response = null
  tags = ["v2", "territory"]
}
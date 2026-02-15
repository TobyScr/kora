// Confirm Strategy section
query "projects/{intervention_id}/behavioral-framing/strategy/confirm" verb=POST {
  api_group = "Strategy"
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
        current_step   : "Strategy"
        next_step      : "Get-Who-To-By"
      }
    } as $func1
  }

  response = null
  tags = ["v2", "strategy"]
}
// Confirm the Assumption Testing section
query "projects/{intervention_id}/assumption-testing/confirm" verb=POST {
  api_group = "Assumption Testing"
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
        current_step   : "Assumption Testing"
        next_step      : "COM-B"
      }
    } as $func1
  }

  response = null
  tags = ["v2", "assumption_finding"]
}
// Confirm the Behavioural Objective section
query "projects/{intervention_id}/behavioral-objective-new/confirm" verb=POST {
  api_group = "Behavioural Objective"
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
        current_step   : "Behavioural Objective"
        next_step      : "Assumption Testing"
      }
    } as $func1
  }

  response = null
  tags = ["behavioral_objective", "v2"]
}
// Confirm COM-B section
query "projects/{intervention_id}/com-b/confirm" verb=POST {
  api_group = "COM-B"
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
        current_step   : "COM-B"
        next_step      : "Personas"
      }
    } as $func1
  }

  response = null
  tags = ["com_b", "v2"]
}
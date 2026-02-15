query "projects/{intervention_id}/behavioral-research/confirm" verb=GET {
  api_group = "Project"
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
        current_step   : "Behavioral Research"
        next_step      : "Persona"
      }
    } as $func
  }

  response = $func.INTERVENTION
}
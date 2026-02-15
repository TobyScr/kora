query generate_single_objective verb=POST {
  api_group = "Behavioural Objective"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    function.run "n8n/understand/generate_single_behavioral_objective" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  }

  response = $func1
}
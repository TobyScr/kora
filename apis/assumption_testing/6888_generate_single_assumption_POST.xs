query generate_single_assumption verb=POST {
  api_group = "Assumption Testing"
  auth = "USER"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    function.run "n8n/understand/generate_single_assumption" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  }

  response = $func1
}
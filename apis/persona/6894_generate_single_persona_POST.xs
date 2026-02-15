query generate_single_persona verb=POST {
  api_group = "Persona"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    function.run "n8n/understand/generate_single_persona" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  }

  response = $func1
}
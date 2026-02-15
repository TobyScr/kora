// Add SYSTEM_MAP record
query generate_single_system_map verb=POST {
  api_group = "System Map"
  auth = "USER"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    function.run "n8n/understand/generate_single_system_map" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  }

  response = $func1
}
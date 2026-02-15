// Generates single TFD record
query generate_single_tfd verb=POST {
  api_group = "TFD"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    function.run "n8n/design/generate_single_tfd" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  }

  response = {result1: "started", started: ""}
}
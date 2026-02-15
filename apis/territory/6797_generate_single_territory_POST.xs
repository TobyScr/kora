// Generates single TERRITORY record
query generate_single_territory verb=POST {
  api_group = "Territory"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    function.run "n8n/design/generate_single_territory" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  }

  response = {result1: "started", started: ""}
}
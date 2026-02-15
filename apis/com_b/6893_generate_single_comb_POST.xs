query generate_single_comb verb=POST {
  api_group = "COM-B"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    enum comb_type? {
      values = ["capability", "opportunity", "motivation"]
    }
  }

  stack {
    function.run "n8n/understand/generate_single_comb" {
      input = {
        intervention_id: $input.intervention_id
        comb_type      : $input.comb_type
      }
    } as $func1
  }

  response = $func1
}
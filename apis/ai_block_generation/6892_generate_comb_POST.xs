query generate_comb verb=POST {
  api_group = "AI Block Generation"

  input {
    int intervention_id?
  }

  stack {
    !function.run "n8n/understand/generate_ta_comb_old" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  
    function.run "n8n/understand/generate_comb" {
      input = {intervention_id: $input.intervention_id}
    } as $func2
  }

  response = {status: "started"}
}
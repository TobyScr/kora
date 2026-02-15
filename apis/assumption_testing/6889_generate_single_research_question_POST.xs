query generate_single_research_question verb=POST {
  api_group = "Assumption Testing"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    function.run "n8n/understand/generate_single_research_question" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  }

  response = $func1
}
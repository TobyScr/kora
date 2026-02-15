query generate_single_research_insight verb=POST {
  api_group = "Research"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    function.run "n8n/understand/generate_single_research_insights" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  }

  response = $func1
}
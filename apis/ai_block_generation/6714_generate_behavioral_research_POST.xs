query generate_behavioral_research verb=POST {
  api_group = "AI Block Generation"

  input {
    int intervention_id?
  }

  stack {
    function.run "n8n/understand/generate_behavioral_hypotheses" {
      input = {intervention_id: $input.intervention_id}
    } as $func2
  
    !function.run "n8n/understand/generate_behavioral_research_questions" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  }

  response = $func2
}
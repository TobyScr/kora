// Adds an entry to the RESEARCH_DEEPRESEARCH_PROMPTS table
query "projects/{intervention_id}/research/deep-research/prompt" verb=POST {
  api_group = "Research"

  input {
    int intervention_id?
    text prompt? filters=trim
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Research Insights"
      }
    } as $func3
  
    db.add RESEARCH_DEEPRESEARCH_PROMPTS {
      data = {
        created_at     : "now"
        intervention_id: $input.intervention_id
        prompt         : $input.prompt
      }
    } as $RESEARCH_DEEPRESEARCH_PROMPTS1
  }

  response = {research_details: "done"}
  tags = ["v2", "deep_research"]
}
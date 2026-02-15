query generate_deep_research verb=POST {
  api_group = "Research"

  input {
    int intervention_id?
    text prompt? filters=trim
  }

  stack {
    db.add RESEARCH_DEEPRESEARCH_PROMPTS {
      data = {
        created_at     : "now"
        intervention_id: $input.intervention_id
        prompt         : $input.prompt
      }
    } as $RESEARCH_DEEPRESEARCH_PROMPTS1
  }

  response = {research_details: "done"}
  tags = ["potentially inactive"]
}
// Retreives the DeepResearch prompts for a given intervention
query "projects/{intervention_id}/research/deep-research/prompt" verb=GET {
  api_group = "Research"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query RESEARCH_DEEPRESEARCH_PROMPTS {
      where = $db.RESEARCH_DEEPRESEARCH_PROMPTS.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $RESEARCH_DEEPRESEARCH_PROMPTS1
  }

  response = $RESEARCH_DEEPRESEARCH_PROMPTS1
  tags = ["v2", "deep_research"]
}
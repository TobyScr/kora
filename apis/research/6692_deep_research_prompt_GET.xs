query deep_research_prompt verb=GET {
  api_group = "Research"
  auth = "USER"

  input {
    int intervention_id?
  }

  stack {
    db.query RESEARCH_DEEPRESEARCH_PROMPTS {
      where = $db.RESEARCH_DEEPRESEARCH_PROMPTS.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $RESEARCH_DEEPRESEARCH_PROMPTS1
  }

  response = $RESEARCH_DEEPRESEARCH_PROMPTS1
}
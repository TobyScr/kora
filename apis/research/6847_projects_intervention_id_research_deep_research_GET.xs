// Retreive the RESEARCH_Files_ table files related to the DeepResearch section of an intervention
query "projects/{intervention_id}/research/deep-research/" verb=GET {
  api_group = "Research"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query RESEARCH_Files_ {
      where = $db.RESEARCH_Files.intervention_id == $input.intervention_id && $db.RESEARCH_Files.subsection == "deep"
      return = {type: "list"}
    } as $RESEARCH_Files1
  }

  response = $RESEARCH_Files1
  tags = ["v2", "deep_research"]
}
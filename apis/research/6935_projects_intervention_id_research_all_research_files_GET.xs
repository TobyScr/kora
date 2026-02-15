// Retreives the DeepResearch prompts for a given intervention
query "projects/{intervention_id}/research/all-research-files" verb=GET {
  api_group = "Research"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query RESEARCH_Files_ {
      where = $db.RESEARCH_Files.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $research_files
  }

  response = $research_files
  tags = ["v2", "deep_research"]
}
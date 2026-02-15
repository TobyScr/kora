// get all uploaded research links
query research_links verb=GET {
  api_group = "Research"
  auth = "USER"

  input {
    int intervention_id?
  }

  stack {
    db.query RESEARCH {
      where = $db.RESEARCH.intervention_id == $input.intervention_id
      return = {type: "list"}
      output = ["proprietary_links", "research_sections_id"]
    } as $RESEARCH1
  }

  response = $RESEARCH1
}
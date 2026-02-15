query check_research verb=GET {
  api_group = "n8n"

  input {
    int intervention_id?
  }

  stack {
    db.query RESEARCH_Files_ {
      where = $db.RESEARCH_Files.intervention_id == $input.intervention_id
      return = {type: "exists"}
    } as $RESEARCH_Files1
  }

  response = $RESEARCH_Files1
}
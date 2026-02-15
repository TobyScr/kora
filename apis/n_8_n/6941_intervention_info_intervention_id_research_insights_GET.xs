// Query all RESEARCH INSIGHTS records
query "intervention-info/{intervention_id}/research_insights" verb=GET {
  api_group = "n8n"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query RESEARCH_INSIGHTS {
      where = $db.RESEARCH_INSIGHTS.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $research_insights
  }

  response = $research_insights
}
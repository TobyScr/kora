// Query all RESEARCH_INSIGHTS records
query "projects/{intervention_id}/research/insights" verb=GET {
  api_group = "Research"
  auth = "USER"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query RESEARCH_INSIGHTS {
      where = $db.RESEARCH_INSIGHTS.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $model
  }

  response = $model
  tags = ["research_insights", "v2"]
}
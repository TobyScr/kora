// Query all RESEARCH_INSIGHTS records
query "projects/{intervention_id}/research/document_insights" verb=GET {
  api_group = "Research"
  auth = "USER"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query DOCUMENT_INSIGHT {
      where = $input.intervention_id == $db.DOCUMENT_INSIGHT.intervention_id
      return = {type: "exists"}
    } as $model
  }

  response = {exists: $model}
  tags = ["research_insights", "v2"]
}
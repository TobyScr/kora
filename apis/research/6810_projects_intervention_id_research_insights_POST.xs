// Add RESEARCH_INSIGHTS record
query "projects/{intervention_id}/research/insights" verb=POST {
  api_group = "Research"

  input {
    dblink {
      table = "RESEARCH_INSIGHTS"
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Research Insights"
      }
    } as $func2
  
    db.add RESEARCH_INSIGHTS {
      data = {
        created_at : "now"
        number     : $input.number
        insight    : $input.insight
        description: $input.description
        source     : $input.source
      }
    } as $model
  }

  response = $model
  tags = ["research_insights", "v2"]
}
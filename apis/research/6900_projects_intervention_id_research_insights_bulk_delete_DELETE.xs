// Bulk Delete RESEARCH_INSIGHTS record
query "projects/{intervention_id}/research-insights/bulk-delete" verb=DELETE {
  api_group = "Research"
  auth = "USER"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    !function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Research Insights"
      }
    } as $func1
  
    db.query RESEARCH_INSIGHTS {
      where = $db.RESEARCH_INSIGHTS.intervention_id == $input.intervention_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Entity not found"
    }
  
    db.bulk.delete RESEARCH_INSIGHTS {
      where = $db.RESEARCH_INSIGHTS.intervention_id == $input.intervention_id
    } as $RESEARCH_INSIGHTS
  }

  response = "Deleted"
  tags = ["research_insights", "v2"]
}
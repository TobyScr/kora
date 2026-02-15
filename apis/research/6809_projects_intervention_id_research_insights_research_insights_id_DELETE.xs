// Delete RESEARCH_INSIGHTS record
query "projects/{intervention_id}/research/insights/{research_insights_id}" verb=DELETE {
  api_group = "Research"
  auth = "USER"

  input {
    uuid research_insights_id?
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Research Insights"
      }
    } as $func1
  
    db.query RESEARCH_INSIGHTS {
      where = $db.RESEARCH_INSIGHTS.intervention_id == $input.intervention_id && $db.RESEARCH_INSIGHTS.id == $input.research_insights_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Entity not found"
    }
  
    db.del RESEARCH_INSIGHTS {
      field_name = "id"
      field_value = $input.research_insights_id
    }
  }

  response = null
  tags = ["research_insights", "v2"]
}
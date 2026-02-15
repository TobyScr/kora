// Edit RESEARCH_INSIGHTS record
query "projects/{intervention_id}/research/insights/{research_insights_id}" verb=PATCH {
  api_group = "Research"
  auth = "USER"

  input {
    uuid research_insights_id?
    dblink {
      table = "RESEARCH_INSIGHTS"
      override = {number: {hidden: true}}
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
  
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch RESEARCH_INSIGHTS {
      field_name = "id"
      field_value = $input.research_insights_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
  tags = ["research_insights", "v2"]
}
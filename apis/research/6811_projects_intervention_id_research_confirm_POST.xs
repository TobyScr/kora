// Confirm the Research section
query "projects/{intervention_id}/research/confirm" verb=POST {
  api_group = "Research"
  auth = "USER"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    function.run "Utils/confirm_intervention_step" {
      input = {
        intervention_id: $input.intervention_id
        current_step   : "Research Insights"
        next_step      : "System Map"
      }
    } as $func1
  }

  response = null
  tags = ["research_insights", "v2"]
}
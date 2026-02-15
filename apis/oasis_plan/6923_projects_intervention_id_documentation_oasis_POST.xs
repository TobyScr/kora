// Add OASIS record
query "projects/{intervention_id}/documentation/oasis" verb=POST {
  api_group = "OASIS Plan"

  input {
    dblink {
      table = "OASIS"
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    }
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "OASIS Plan"
      }
    }
  
    db.add OASIS {
      data = {
        created_at         : "now"
        core_challenge     : $input.core_challenge
        outcome            : $input.outcome
        campaign_objectives: $input.campaign_objectives
        demographics       : $input.demographics
        attitudes_behaviors: $input.attitudes_behaviors
        barriers           : $input.barriers
        selected_strategy  : $input.selected_strategy
        key_messages       : $input.key_messages
        core_cta           : $input.core_cta
        creative_territory : $input.creative_territory
        user_journey       : $input.user_journey
        timings            : $input.timings
        metrics            : $input.metrics
      }
    } as $model
  }

  response = $model
  tags = ["v2", "oasis"]
}
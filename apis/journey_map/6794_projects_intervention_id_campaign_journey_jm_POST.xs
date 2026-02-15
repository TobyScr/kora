// Add a JOURNEY_MAP record
query "projects/{intervention_id}/campaign-journey/jm" verb=POST {
  api_group = "Journey Map"

  input {
    dblink {
      table = "JOURNEY_MAP"
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    }
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Journey Map"
      }
    }
  
    db.add JOURNEY_MAP {
      data = {
        journey_phase_id: $input.journey_phase_id
        intervention_id : $input.intervention_id
        key_moments     : $input.key_moments
        key_messages    : $input.key_messages
        key_mechanism   : $input.key_mechanism
        call_to_action  : $input.call_to_action
        created_at      : now
      }
    } as $model
  }

  response = $model
  tags = ["v2", "journey_map"]
}
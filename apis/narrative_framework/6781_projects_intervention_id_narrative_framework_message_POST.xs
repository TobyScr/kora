// Add KEY_MESSAGE record
query "projects/{intervention_id}/narrative-framework/message" verb=POST {
  api_group = "Narrative Framework"

  input {
    dblink {
      table = "KEY_MESSAGE"
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Narrative Framework"
      }
    } as $func2
  
    db.add KEY_MESSAGE {
      data = {
        intervention_id  : $input.intervention_id
        source_id        : $input.source_id
        created_at       : "now"
        message          : $input.message
        proof_points     : $input.proof_points
        counter_narrative: $input.counter_narrative
        riposte          : $input.riposte
      }
    } as $model
  }

  response = $model
  tags = ["v2", "narrative_framework", "key_message"]
}
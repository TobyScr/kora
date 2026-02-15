// Add SM_PROPOSITION record
query "projects/{intervention_id}/creative-strategy/smp" verb=POST {
  api_group = "SMP"

  input {
    dblink {
      table = "SM_PROPOSITION"
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    }
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Single-Minded Proposition"
      }
    }
  
    db.add SM_PROPOSITION {
      data = {
        intervention_id: $input.intervention_id
        created_at     : "now"
        proposition    : $input.proposition
        selected       : false
      }
    } as $model
  }

  response = $model
  tags = ["v2", "smp"]
}
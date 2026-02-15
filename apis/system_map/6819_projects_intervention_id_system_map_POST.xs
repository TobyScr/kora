// Add SYSTEM_MAP record
query "projects/{intervention_id}/system-map" verb=POST {
  api_group = "System Map"

  input {
    dblink {
      table = "SYSTEM_MAP"
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "System Map"
      }
    } as $func2
  
    db.add SYSTEM_MAP {
      data = {
        created_at     : "now"
        intervention_id: $input.intervention_id
        challenge      : $input.challenge
        description    : $input.description
        is_selected    : false
      }
    } as $model
  }

  response = $model
  tags = ["system_map", "v2"]
}
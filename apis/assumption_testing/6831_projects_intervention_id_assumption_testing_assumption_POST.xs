// Add ASSUMPTION record
query "projects/{intervention_id}/assumption-testing/assumption" verb=POST {
  api_group = "Assumption Testing"

  input {
    dblink {
      table = "ASSUMPTION"
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Assumption Testing"
      }
    } as $func2
  
    db.add ASSUMPTION {
      data = {
        created_at     : "now"
        intervention_id: $input.intervention_id
        assumption     : $input.assumption
      }
    } as $model
  }

  response = $model
  tags = ["v2", "assumption"]
}
// Add STRATEGY record
query "projects/{intervention_id}/behavioral-framing/strategy" verb=POST {
  api_group = "Strategy"

  input {
    dblink {
      table = "STRATEGY"
      override = {selected: {hidden: true}, created_at: {hidden: true}}
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Strategy"
      }
    } as $func2
  
    db.add STRATEGY {
      data = {
        intervention_id: $input.intervention_id
        created_at     : now
        strategy       : $input.strategy
        type           : $input.type
        description    : $input.description
        pros           : $input.pros
        cons           : $input.cons
        selected       : false
      }
    } as $model
  }

  response = $model
  tags = ["v2", "strategy"]
}
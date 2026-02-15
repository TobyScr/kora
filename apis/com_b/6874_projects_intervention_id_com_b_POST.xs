// Add COM_B record
query "projects/{intervention_id}/com-b" verb=POST {
  api_group = "COM-B"

  input {
    dblink {
      table = "COM_B"
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {intervention_id: $input.intervention_id, step: "COM-B"}
    } as $func2
  
    db.add COM_B {
      data = {
        created_at     : "now"
        intervention_id: $input.intervention_id
        type           : $input.type
        barrier        : $input.barrier
        description    : $input.description
        selected       : false
      }
    } as $model
  }

  response = $model
  tags = ["com_b", "v2"]
}
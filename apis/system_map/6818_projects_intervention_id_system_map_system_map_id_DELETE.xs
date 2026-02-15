// Delete SYSTEM_MAP record
query "projects/{intervention_id}/system-map/{system_map_id}" verb=DELETE {
  api_group = "System Map"
  auth = "USER"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    uuid system_map_id?
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
  
    db.del SYSTEM_MAP {
      field_name = "id"
      field_value = $input.system_map_id
    }
  }

  response = null
  tags = ["system_map", "v2"]
}
// Edit SYSTEM_MAP record
query "projects/{intervention_id}/system-map/{system_map_id}" verb=PATCH {
  api_group = "System Map"
  auth = "USER"

  input {
    uuid system_map_id?
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
  
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch SYSTEM_MAP {
      field_name = "id"
      field_value = $input.system_map_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
  tags = ["system_map", "v2"]
}
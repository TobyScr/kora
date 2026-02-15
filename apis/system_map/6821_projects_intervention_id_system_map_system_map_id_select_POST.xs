// Select a given SYSTEM_MAP record and deselect the previous one
query "projects/{intervention_id}/system-map/{system_map_id}/select" verb=POST {
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
  
    db.query SYSTEM_MAP {
      where = $db.SYSTEM_MAP.intervention_id == $input.intervention_id && $db.SYSTEM_MAP.id == $input.system_map_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
    }
  
    db.query SYSTEM_MAP {
      where = $db.SYSTEM_MAP.intervention_id == $input.intervention_id && $db.SYSTEM_MAP.id != $input.system_map_id && $db.SYSTEM_MAP.is_selected == true
      return = {type: "single"}
      output = ["id"]
    } as $PREVIOUS_SELECTED
  
    conditional {
      if ($PREVIOUS_SELECTED != null) {
        db.edit SYSTEM_MAP {
          field_name = "id"
          field_value = $PREVIOUS_SELECTED.id
          data = {is_selected: false}
        } as $DESELECTED
      }
    }
  
    db.edit SYSTEM_MAP {
      field_name = "id"
      field_value = $input.system_map_id
      data = {is_selected: true}
    } as $DESELECTED
  }

  response = null
  tags = ["system_map", "v2"]
}
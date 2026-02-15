// Query selected SYSTEM_MAP record related to an intervention
query "projects/{intervention_id}/system-map/selected" verb=GET {
  api_group = "System Map"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query SYSTEM_MAP {
      where = $db.SYSTEM_MAP.intervention_id == $input.intervention_id && $db.SYSTEM_MAP.is_selected == true
      return = {type: "single"}
    } as $model
  }

  response = $model
  tags = ["system_map", "v2"]
}
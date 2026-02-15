// Query all SYSTEM_MAP records related to an intervention
query "projects/{intervention_id}/system-map" verb=GET {
  api_group = "System Map"
  auth = "USER"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query SYSTEM_MAP {
      where = $db.SYSTEM_MAP.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $model
  }

  response = $model
  tags = ["system_map", "v2"]
}
// Query all SYSTEM_MAP records
query "intervention-info/{intervention_id}/system_map" verb=GET {
  api_group = "n8n"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query SYSTEM_MAP {
      where = $db.SYSTEM_MAP.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $system_map
  }

  response = $system_map
}
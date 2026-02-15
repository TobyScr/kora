table SYSTEM_MAP {
  auth = false

  schema {
    uuid id
    timestamp created_at?=now
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    text challenge? filters=trim
    text description? filters=trim
    bool is_selected?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["active", "system_map", "v2"]
}
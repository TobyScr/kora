table MREL_INDICATORS {
  auth = false

  schema {
    uuid id
    int indicator_type? {
      table = "OS_INDICATOR_TYPE"
    }
  
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    text indicator?
    text target?
    text data_source?
    timestamp created_at?=now
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
  ]

  tags = ["active", "v2", "mrel"]
}
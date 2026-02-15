table CBD_AUDIENCE {
  auth = false

  schema {
    uuid id
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    timestamp created_at?=now
    text target_profile?
    text barriers?
    text strategy? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
  ]

  tags = ["active", "v2", "creative_brief"]
}
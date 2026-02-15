table ASSUMPTION {
  auth = false

  schema {
    uuid id
    timestamp created_at?=now
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    text assumption? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["active", "assumption", "v2"]
}
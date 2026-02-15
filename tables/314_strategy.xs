table STRATEGY {
  auth = false

  schema {
    uuid id
    int intervention_id {
      table = "INTERVENTION"
    }
  
    timestamp created_at?=now
    text strategy?
    text type?=1
    text description?
    text pros?
    text cons? filters=trim
    bool selected?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
  ]

  tags = ["active", "v2", "strategy"]
}
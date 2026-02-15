table GET_WHO_TO_BY {
  auth = false

  schema {
    uuid id
    int intervention_id {
      table = "INTERVENTION"
    }
  
    timestamp created_at?=now
    text get?
    text who?
    text to?
    text by?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
  ]

  tags = ["active", "v2", "get_who_to_by"]
}
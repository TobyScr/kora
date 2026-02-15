table OS_JOURNEY_PHASE {
  auth = false

  schema {
    int id
    text name?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
  ]

  tags = ["active", "v2", "journey_map"]
}
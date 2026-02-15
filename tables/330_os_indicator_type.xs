table OS_INDICATOR_TYPE {
  auth = false

  schema {
    int id
    text name?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
  ]

  tags = ["active", "v2", "mrel"]
}
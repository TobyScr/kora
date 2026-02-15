table DEMOGRAPHICS {
  auth = false

  schema {
    uuid id
    text location?
    text language?
    text children?
    text employment?
    text education?
    text name?
    text age?
    text gender?
    text marital_status?
    text quote? filters=trim
    image? file?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
  ]

  tags = ["active", "persona", "v2"]
}
table PSYCHOGRAPHICS {
  auth = false

  schema {
    uuid id
    text values?
    text aspirations? filters=trim
    text life_goals? filters=trim
    text concerns_challenges? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
  ]

  tags = ["active", "persona", "v2"]
}
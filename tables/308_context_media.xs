table CONTEXT_MEDIA {
  auth = false

  schema {
    uuid id
    text social_influencer_network?
    text media_consumption_habits? filters=trim
    text language_symbols? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
  ]

  tags = ["active", "persona", "v2"]
}
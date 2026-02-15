// Stores information about social media channels (types)
table SOCIAL_MEDIA_CHANNEL {
  auth = false

  schema {
    int id
  
    // The name of the social media channel (e.g., 'Twitter', 'YouTube')
    text name? filters=trim
  
    // This column will contain an url of the logo of social media.
    text logo? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
    {type: "btree|unique", field: [{name: "name", op: "asc"}]}
  ]

  tags = ["active"]
}
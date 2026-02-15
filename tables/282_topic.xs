// Stores information about topics
table TOPIC {
  auth = false

  schema {
    int id
    timestamp created_at?=now
  
    // The name of the topic
    text name? filters=trim
  
    // A description of the topic
    text description? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
    {type: "btree|unique", field: [{name: "name", op: "asc"}]}
  ]
}
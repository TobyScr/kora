// This table will allow us to store a list of clients
table CLIENT {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    text name? filters=trim|min:2|max:80
    text description? filters=trim
    bool is_deleted?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
    {type: "btree|unique", field: [{name: "name", op: "asc"}]}
  ]

  tags = ["client", "active"]
}
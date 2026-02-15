// This table will contain the list of languages a partner can potentially have.
table LANGUAGE {
  auth = false

  schema {
    int id
    text name? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree|unique", field: [{name: "name", op: "asc"}]}
  ]

  tags = ["language", "active"]
}
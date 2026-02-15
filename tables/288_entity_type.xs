// This table will contain the list of entity types a partner can potentially have.
table ENTITY_TYPE {
  auth = false

  schema {
    int id
    text name? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree|unique", field: [{name: "name", op: "asc"}]}
  ]

  tags = ["entity-type", "active"]
}
// This table will contain the list of countries a partner can potentially have.
table COUNTRY {
  auth = false

  schema {
    int id
    text name? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree|unique", field: [{name: "name", op: "asc"}]}
  ]

  tags = ["country", "active"]
}
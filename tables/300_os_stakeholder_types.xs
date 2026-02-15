table OS_STAKEHOLDER_TYPES {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    text name? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["active", "deprecated"]
}
// User events
table EVENT_TYPE {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    text event_name? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["event-type", "active"]
}
table OS_STAKEHOLDER_ROLE_PHRASES {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    int os_stakeholder_types_id? {
      table = "OS_STAKEHOLDER_TYPES"
    }
  
    text phrase? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["active", "deprecated"]
}
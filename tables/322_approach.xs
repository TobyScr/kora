table APPROACH {
  auth = false

  schema {
    uuid id
    timestamp created_at?=now
    int intervention_id {
      table = "INTERVENTION"
    }
  
    uuid selected_option_id? {
      table = "OS_APPROACH_OPTIONS"
    }
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
    {
      type : "btree|unique"
      field: [{name: "intervention_id", op: "asc"}]
    }
  ]

  tags = ["active", "v2", "approach"]
}
table CORE_NARRATIVE {
  auth = false

  schema {
    uuid id
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    timestamp created_at?=now
    enum title? {
      values = ["Beginning", "Tension", "Resolution"]
    }
  
    text narrative?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {
      type : "btree|unique"
      field: [
        {name: "intervention_id", op: "asc"}
        {name: "title", op: "asc"}
      ]
    }
  ]

  tags = ["active", "v2", "narrative_framework", "core_narrative"]
}
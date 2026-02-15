table RESEARCH_INSIGHTS {
  auth = false

  schema {
    uuid id
    timestamp created_at?=now
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    text insight? filters=trim
    text description? filters=trim
    enum[] source? {
      values = ["Existing research", "DeepResearch"]
    }
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["active", "research_insights", "v2"]
}
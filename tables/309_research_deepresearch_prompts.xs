table RESEARCH_DEEPRESEARCH_PROMPTS {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    int intervention_id {
      table = "INTERVENTION"
    }
  
    text prompt? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["active"]
}
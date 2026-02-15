table RESEARCH_QUESTION {
  auth = false

  schema {
    uuid id
    timestamp created_at?=now
    int intervention_id {
      table = "INTERVENTION"
    }
  
    text question? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["active", "research_question", "v2"]
}
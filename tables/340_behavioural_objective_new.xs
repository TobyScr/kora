table BEHAVIOURAL_OBJECTIVE_NEW {
  auth = false

  schema {
    uuid id
    timestamp created_at?=now
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    text objective? filters=trim
    bool is_selected?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["active", "behavioral_objective", "v2"]
}
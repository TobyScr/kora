table COM_B {
  auth = false

  schema {
    uuid id
    timestamp created_at?=now
    int intervention_id {
      table = "INTERVENTION"
    }
  
    enum type? {
      values = ["capability", "opportunity", "motivation"]
    }
  
    text barrier? filters=trim
    text description? filters=trim
    bool selected?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["active", "com_b", "v2"]
}
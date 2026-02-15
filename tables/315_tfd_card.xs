table TFD_CARD {
  auth = false

  schema {
    uuid id
    timestamp created_at?=now
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    uuid? com_b1_id? {
      table = "COM_B"
    }
  
    uuid? com_b2_id? {
      table = "COM_B"
    }
  
    text current_think?
    text current_feel?
    text current_do?
    text future_think?
    text future_feel?
    text future_do?
    bool selected?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
  ]

  tags = ["active", "v2", "think_feel_do"]
}
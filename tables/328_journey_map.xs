table JOURNEY_MAP {
  auth = false

  schema {
    uuid id
    int journey_phase_id? {
      table = "OS_JOURNEY_PHASE"
    }
  
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    text key_moments?
    text key_messages?
    text key_mechanism?
    timestamp? created_at
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
  ]

  tags = ["active", "v2", "journey_map"]
}
table CBD_BRIEF {
  auth = false

  schema {
    uuid id
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    text territory?
    text cta?
    text smp?
    text key_messages?
    timestamp created_at?=now
    text tfd_shift?
    text deliverables?
    text timings?
    text mandatories?
    text budget?
    text inspiration?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
  ]

  tags = ["active", "v2", "creative_brief"]
}
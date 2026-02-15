table OASIS {
  auth = false

  schema {
    uuid id
    timestamp created_at?=now
    int intervention_id {
      table = "INTERVENTION"
    }
  
    text core_challenge? filters=trim
    text outcome? filters=trim
    text campaign_objectives? filters=trim
    text demographics? filters=trim
    text attitudes_behaviors? filters=trim
    text barriers? filters=trim
    text selected_strategy? filters=trim
    text key_messages? filters=trim
    text core_cta? filters=trim
    text creative_territory? filters=trim
    text user_journey? filters=trim
    text timings? filters=trim
    text metrics? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
    {
      type : "btree|unique"
      field: [{name: "intervention_id", op: "asc"}]
    }
  ]

  tags = ["active", "v2", "oasis"]
}
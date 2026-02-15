table API_KEY {
  auth = false

  schema {
    uuid id
    timestamp created_at?=now
    text Client? filters=trim
    timestamp? last_time_used?
    enum status?=Inactive {
      values = ["Active", "Inactive"]
    }
  
    timestamp? expired_at?
    text api_key_hast? filters=trim
    text salt? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]
}
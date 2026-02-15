// User event logs
table USER_ANALYTICS {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    int user_id? {
      table = "USER"
    }
  
    int event_id? {
      table = "EVENT_TYPE"
    }
  
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]
}
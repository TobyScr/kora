// this table holds a record of wizard step a user has seen/dismissed
table WIZARD_SEEN_LOGS {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    int first_time_wizard_id? {
      table = "FIRST_TIME_WIZARD"
    }
  
    int user_id? {
      table = "USER"
    }
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["active"]
}
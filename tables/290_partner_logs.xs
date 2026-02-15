// This table will contain the logs of Partner table.
table PARTNER_LOGS {
  auth = false

  schema {
    int id
    timestamp created_at?=now
  
    // This column will contain the user id of the one who made the changes to Partner.
    int changed_by {
      table = "USER"
    }
  
    // This column will show which action has taken the user during the change.
    enum action {
      values = ["edit", "delete", "create"]
    }
  
    int partner_id {
      table = "PARTNER"
    }
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["partner-log", "active"]
}
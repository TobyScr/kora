// This table will allow us to store a clients projects
table PROJECT {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    text name? filters=trim
    text description? filters=trim
  
    // This is a reference to CLIENT table
    int client_id {
      table = "CLIENT"
    }
  
    int? number_of_interventions?
    timestamp? last_updated_at?
    bool is_deleted?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["project", "active"]
}
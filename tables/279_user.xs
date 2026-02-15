table USER {
  auth = true

  schema {
    int id
    timestamp created_at?=now
    text name? filters=trim
    email? email? filters=trim|lower
    password? password? filters=min:8|minAlpha:1|minDigit:1
  
    // This column contains the role of the user.
    int role_id {
      table = "ROLE"
    }
  
    // Magic link object with token and expiration
    object? magic_link? {
      schema {
        text token? filters=trim
      
        // Time the token expires
        timestamp expiration?
      
        bool used?
      }
    }
  
    // This column is used to indicate whether an user is active or inactive.
    bool is_deleted?
  
    // This column keeps track of the login times of the user.
    timestamp? last_login?
  
    text last_url? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
    {type: "btree|unique", field: [{name: "email", op: "asc"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
  ]

  tags = ["active"]
}
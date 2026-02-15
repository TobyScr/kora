table USER_CLIENT {
  auth = false

  schema {
    int id
    int client_id {
      table = "CLIENT"
    }
  
    int user_id {
      table = "USER"
    }
  
    int role_id {
      table = "ROLE"
    }
  }

  index = [{type: "primary", field: [{name: "id"}]}]
  tags = ["active"]
}
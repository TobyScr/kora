// Login and retrieve an authentication token
query "auth/login" verb=POST {
  api_group = "Authentication"

  input {
    email email? filters=trim|lower
    text password?
  }

  stack {
    db.get USER {
      field_name = "email"
      field_value = $input.email
      output = ["id", "created_at", "name", "email", "password", "is_deleted"]
    } as $user
  
    precondition ($user != null) {
      error_type = "accessdenied"
      error = "Invalid Credentials."
    }
  
    precondition ($user.is_deleted == false) {
      error_type = "accessdenied"
      error = "User account does not exist."
    }
  
    security.check_password {
      text_password = $input.password
      hash_password = $user.password
    } as $pass_result
  
    precondition ($pass_result) {
      error_type = "accessdenied"
      error = "Invalid Credentials."
    }
  
    security.create_auth_token {
      table = "USER"
      extras = {}
      expiration = 604800
      id = $user.id
    } as $authToken
  
    db.edit USER {
      field_name = "email"
      field_value = $input.email
      data = {last_login: now}
    } as $USER_edit
  }

  response = {authToken: $authToken}
}
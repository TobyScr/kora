// Signup and retrieve an authentication token
query "auth/signup" verb=POST {
  api_group = "Authentication"
  auth = "USER"

  input {
    text name?
    email email? filters=trim|lower
    int role_id
  }

  stack {
    db.get USER {
      field_name = "id"
      field_value = $auth.id
      addon = [
        {
          name : "ROLE"
          input: {ROLE_id: $output.role_id}
          as   : "_role"
        }
      ]
    } as $user_admin
  
    precondition ($user_admin != null) {
      error_type = "notfound"
      error = "Admin not found."
    }
  
    precondition ($user_admin._role.role == $env.Kora_admin_name) {
      error_type = "accessdenied"
      error = "Invalid access."
    }
  
    db.get ROLE {
      field_name = "id"
      field_value = $input.role_id
    } as $ROLE1
  
    precondition ($ROLE1 != null) {
      error_type = "notfound"
      error = "Role not found."
    }
  
    !precondition ($ROLE1.role != $env.Kora_admin_name) {
      error_type = "badrequest"
      error = "Cannot assign this role, please select another!"
    }
  
    db.get USER {
      field_name = "email"
      field_value = $input.email
    } as $user
  
    precondition ($user == null) {
      error_type = "accessdenied"
      error = "This account is already in use."
    }
  
    security.create_password {
      character_count = 15
      require_lowercase = true
      require_uppercase = true
      require_digit = true
      require_symbol = true
      symbol_whitelist = ""
    } as $generatedPassword
  
    db.add USER {
      data = {
        created_at: "now"
        name      : $input.name
        email     : $input.email
        password  : $generatedPassword
        role_id   : $input.role_id
        is_deleted: false
        last_login: now
        magic_link: null
      }
    } as $user_added
  
    function.run "New user logic" {
      input = {email: $input.email}
    } as $send_email_to_user
  }

  response = $user
}
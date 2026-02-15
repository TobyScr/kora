// Deactivate an user as superadmin
query "user/deactivate" verb=POST {
  api_group = "User"
  auth = "USER"

  input {
    int user_id
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
      error = "Invalid access level."
    }
  
    db.get USER {
      field_name = "id"
      field_value = $input.user_id
      addon = [
        {
          name : "ROLE"
          input: {ROLE_id: $output.role_id}
          as   : "_role"
        }
      ]
    } as $user
  
    precondition ($user != null) {
      error_type = "notfound"
      error = "User not found."
    }
  
    precondition ($user._role.role != $env.Kora_admin_name) {
      error_type = "unauthorized"
      error = "Cannot edit admin role."
    }
  
    db.edit USER {
      field_name = "id"
      field_value = $input.user_id
      data = {is_deleted: true}
    } as $USER1
  }

  response = "User successsfully deactivated!"
}
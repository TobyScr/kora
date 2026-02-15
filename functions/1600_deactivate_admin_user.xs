// This function deactivates an admin user. It is triggered manually and not used within any endpoint!
function "Deactivate admin user" {
  input {
    int user_id?
  }

  stack {
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
    } as $USER1
  
    precondition ($USER1 != null) {
      error_type = "notfound"
      error = "User not found."
    }
  
    precondition ($USER1._role.name == $env.Kora_admin_name) {
      error_type = "badrequest"
      error = "User is not admin."
    }
  
    db.edit USER {
      field_name = "id"
      field_value = $input.user_id
      data = {is_deleted: true}
    } as $USER2
  }

  response = $USER1
  tags = ["user"]
}
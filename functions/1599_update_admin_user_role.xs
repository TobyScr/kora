// This function updates an admins user role. It is triggered manually and not used within any endpoint!
function "Update admin user role" {
  input {
    int user_id?
    int role_id?
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
      error = "User not an admin."
    }
  
    db.get ROLE {
      field_name = "id"
      field_value = $input.role_id
    } as $ROLE1
  
    precondition ($ROLE1 != null) {
      error_type = "notfound"
      error = "Role not found."
    }
  
    precondition ($USER1._role.id != $input.role_id) {
      error_type = "badrequest"
      error = "User already has that role."
    }
  
    db.edit USER {
      field_name = "id"
      field_value = $input.user_id
      data = {role_id: $input.role_id}
    } as $USER2
  }

  response = $USER2
  tags = ["user"]
}
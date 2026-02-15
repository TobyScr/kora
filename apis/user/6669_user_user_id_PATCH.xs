query "user/{user_id}" verb=PATCH {
  api_group = "User"
  auth = "USER"

  input {
    int user_id? filters=min:1
    dblink {
      table = "USER"
      override = {email: {hidden: true}, magic_link: {hidden: true}}
    }
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
    } as $USER_admin
  
    precondition ($auth.id != $input.user_id) {
      error_type = "badrequest"
      error = "Cannot edit own role."
    }
  
    precondition ($USER_admin._role.role == $env.Kora_admin_name) {
      error_type = "accessdenied"
      error = "Invalid access."
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
    } as $USER_change
  
    precondition ($USER_change != null) {
      error_type = "notfound"
      error = "User not found."
    }
  
    precondition ($USER_change._role.role != $env.Kora_admin_name) {
      error_type = "badrequest"
      error = "Cannot edit admin role."
    }
  
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch USER {
      field_name = "id"
      field_value = $input.user_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
}
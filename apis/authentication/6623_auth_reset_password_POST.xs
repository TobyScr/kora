// After completing the forgot password flow add a new password with this endpoint.
query "auth/reset-password" verb=POST {
  api_group = "Authentication"
  auth = "USER"

  input {
    text new_password filters=trim
    text confirm_password filters=trim
  }

  stack {
    precondition ($input.new_password == $input.confirm_password) {
      error_type = "badrequest"
      error = "The passwords don't match."
    }
  
    db.get USER {
      field_name = "id"
      field_value = $auth.id
      output = [
        "id"
        "created_at"
        "name"
        "email"
        "magic_link.token"
        "magic_link.expiration"
        "magic_link.used"
      ]
    } as $user1
  
    precondition ($user1 != null) {
      error_type = "notfound"
      error = "User not found."
    }
  
    db.edit USER {
      field_name = "id"
      field_value = $auth.id
      data = {
        password  : $input.new_password
        magic_link: {
        token     : $user1.magic_link.token
        expiration: $user1.magic_link.expiration
        used      : true
      }
      }
    } as $user2
  }

  response = $user1
}
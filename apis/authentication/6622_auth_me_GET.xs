// Get the user record belonging to the authentication token
query "auth/me" verb=GET {
  api_group = "Authentication"
  auth = "USER"

  input {
  }

  stack {
    db.get USER {
      field_name = "id"
      field_value = $auth.id
      output = [
        "id"
        "created_at"
        "name"
        "email"
        "role_id"
        "is_deleted"
        "last_login"
        "last_url"
        "magic_link.token"
        "magic_link.expiration"
        "magic_link.used"
      ]
    
      addon = [
        {
          name  : "ROLE"
          output: ["id", "created_at", "name", "role"]
          input : {ROLE_id: $output.role_id}
          as    : "role_name"
        }
      ]
    } as $user
  }

  response = $user
}
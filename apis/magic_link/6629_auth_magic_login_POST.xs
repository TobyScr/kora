// Exchanges magic token for auth token
query "auth/magic-login" verb=POST {
  api_group = "Magic Link"

  input {
    text magic_token? filters=trim
  }

  stack {
    precondition ($input.magic_token != null) {
      error = "magic_token is required but was not provided."
    }
  
    placeholder "mvp:crypto_jwe_decode"
    precondition (($decoded_magic_token|get:"user_id":null) != null && ($decoded_magic_token|get:"magic_token":null) != null) {
      error = "Corrupt magic_token. Please request another magic link."
    }
  
    db.get USER {
      field_name = "id"
      field_value = $decoded_magic_token|get:"user_id":null
    } as $user
  
    precondition ($user != null) {
      error_type = "notfound"
      error = "User not found."
    }
  
    precondition ($user.magic_link.token == $decoded_magic_token.magic_token) {
      error = "Incorrect magic_token. Please request another one."
    }
  
    precondition ($user.magic_link.expiration > now) {
      error = "Magic token has expired. Please request another one."
    }
  
    precondition ($user.magic_link.used == false) {
      error = "This magic link has already been used. Please request another one."
    }
  
    security.create_auth_token {
      table = "USER"
      extras = ""
      expiration = 86400
      id = $user.id
    } as $auth_token
  
    db.edit USER {
      field_name = "id"
      field_value = $decoded_magic_token|get:"user_id":null
      data = {last_login: now}
    } as $USER1
  }

  response = {token: $auth_token}
}
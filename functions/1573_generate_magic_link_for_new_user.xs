// This function generates a magic token with a 60 minute expiration date.
function generate_magic_link_for_new_user {
  input {
    email email?
  }

  stack {
    precondition ($input.email != null) {
      error = "email is required but was not suppiled. "
    }
  
    db.query USER {
      where = $db.USER.email == $input.email
      return = {type: "single"}
    } as $user
  
    precondition ($user != null) {
      error_type = "notfound"
      error = "No user found for that email."
    }
  
    security.create_password {
      character_count = 12
      require_lowercase = true
      require_uppercase = true
      require_digit = true
      require_symbol = false
      symbol_whitelist = ""
    } as $token
  
    var $magic_link {
      value = {}
        |set:"token":$token
        |set:"expiration":(now
          |add_secs_to_timestamp:($env.magic_link_new_user_expiry_time|to_int)
        )
        |set:"used":false
    }
  
    var $jwt_payload {
      value = {}
        |set:"user_id":($user|get:"id":0)
        |set:"magic_token":($magic_link|get:"token":null)
    }
  
    db.edit USER {
      field_name = "id"
      field_value = $user|get:"id":0
      data = {
        magic_link: {
        token     : $token
        expiration: now|add_secs_to_timestamp:($env.magic_link_new_user_expiry_time|to_int)
        used      : false
      }
      }
    } as $updated_magic_link
  
    placeholder "mvp:crypto_jwe_encode"
    var $magic_link {
      value = ""
    }
  
    conditional {
      if ($env.$datasource == "dev") {
        var.update $magic_link {
          value = $env.magic_link_redirect_uri_test|concat:$jwt:""
        }
      }
    
      else {
        var.update $magic_link {
          value = $env.magic_link_redirect_uri_live|concat:$jwt:""
        }
      }
    }
  }

  response = $magic_link
}
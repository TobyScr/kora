function "apiKey/validate" {
  input {
    text public? filters=trim
    text secret? filters=trim
  }

  stack {
    !db.get API_KEY {
      field_name = "id"
      field_value = $input.public
    } as $key
  
    !precondition ($key != null) {
      error_type = "unauthorized"
    }
  
    !conditional {
      if ($key.expired_at < now) {
        db.edit API_KEY {
          field_name = "id"
          field_value = $input.public
          data = {status: "Inactive"}
        } as $API_KEY1
      }
    }
  
    !precondition ($key.expired_at >= now) {
      error_type = "unauthorized"
    }
  
    !var $hashedValue {
      value = ""
        |hmac_sha256:($input.secret
          |concat:($key.salt|concat:$env.pepper:""):""
        ):false
    }
  
    !precondition ($hashedValue == $key.api_key_hast) {
      error_type = "accessdenied"
    }
  
    !db.edit API_KEY {
      field_name = "id"
      field_value = $input.public
      data = {last_time_used: now}
    } as $API_KEY2
  }

  response = null
}
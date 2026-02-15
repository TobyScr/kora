function "apiKey/generate" {
  input {
    text company_name? filters=trim
  }

  stack {
    var $salt {
      value = ""|uuid
    }
  
    var $api_key {
      value = ""|hmac_sha256:(""|uuid):false
    }
  
    var $hashedValue {
      value = ""
        |hmac_sha256:($api_key
          |concat:($salt|concat:$env.pepper:""):""
        ):false
    }
  
    db.add API_KEY {
      data = {
        created_at  : "now"
        Client      : $input.company_name
        status      : "Active"
        expired_at  : now|add_secs_to_timestamp:(86400|multiply:1800)
        api_key_hast: ""
        salt        : ""
      }
    } as $API_KEY1
  }

  response = {secret: $api_key, public: $API_KEY1.id}
}
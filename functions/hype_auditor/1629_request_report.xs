// Given a Social and a username/user_id from the corresponding social.
// Send a request to HA for its report.
function "HypeAuditor/Request Report" {
  input {
    enum social_lookout? {
      values = ["INSTAGRAM", "YOUTUBE", "TIKTOK", "INSTAGRAM_ID", "TIKTOK_ID", "X"]
    }
  
    text lookup_value? filters=trim
  }

  stack {
    var $SOCIAL_LINK {
      value = {}
        |set:"INSTAGRAM":"auditor.report"
        |set:"INSTAGRAM_ID":"auditor.reportByUserId"
        |set:"YOUTUBE":"auditor.youtube"
        |set:"TIKTOK":"auditor.tiktok"
        |set:"TIKTOK_ID":"auditor.tiktokByUserId"
        |!set:"TWITTER":"auditor.twitter"
        |set:"X":"auditor.twitter"
        |!set:"TWITCH":"auditor.twitch"
        |!set:"SNAPCHAT":"auditor.snapchat"
    }
  
    conditional {
      if ($input.social_lookout == "INSTAGRAM") {
        var $LOOKUP_NAME {
          value = "username"
        }
      }
    
      elseif ($input.social_lookout == "INSTAGRAM_ID" || $input.social_lookout == "TIKTOK_ID") {
        var $LOOKUP_NAME {
          value = "user_id"
        }
      }
    
      else {
        var $LOOKUP_NAME {
          value = "channel"
        }
      }
    }
  
    var $hyper_url {
      value = "https://hypeauditor.com/api/method/"
        |concat:($SOCIAL_LINK|get:$input.social_lookout:null):""
        |concat:"/":""
    }
  
    var $PARAMS {
      value = {}
        |set:$LOOKUP_NAME:$input.lookup_value
    }
  
    var $HEADERS {
      value = []
        |push:("x-auth-id: "|concat:$env.hype_auth_id:"")
        |push:("x-auth-token: "|concat:$env.hype_auth_token:"")
    }
  
    api.request {
      url = $hyper_url
      method = "GET"
      params = $PARAMS
      headers = $HEADERS
    } as $response
  }

  response = $var.response
  tags = ["hype_auditor"]
}
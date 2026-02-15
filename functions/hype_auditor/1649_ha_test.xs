function "HypeAuditor/HA test" {
  input {
  }

  stack {
    group {
      stack {
        var $hyper_url {
          value = "https://hypeauditor.com/api/method/auditor.creators"
        }
      
        var $to {
          value = now
        }
      
        var $from {
          value = $to|add_secs_to_timestamp:-86400
        }
      
        var $PARAMS {
          value = {}
            |!set:"report_unlocked_from":($from|format_timestamp:"c":"UTC")
            |!set:"report_unlocked_to":($to|format_timestamp:"c":"UTC")
            |set:"limit":1
        }
      
        var $HEADERS {
          value = []
            |push:("x-auth-id: "|concat:$env.hype_auth_id:"")
            |push:("x-auth-token: "|concat:$env.hype_auth_token:"")
        }
      
        var $cursor {
          value = -1
        }
      
        var $x1 {
          value = []
        }
      
        while ($cursor != null) {
          each {
            api.request {
              url = $hyper_url
              method = "GET"
              params = $PARAMS
              headers = $HEADERS
            } as $response
          
            array.push $x1 {
              value = $var.response
                |get:"response":{}
                |get:"result":{}
                |get:"result":{}
                |get:"creators":null
            }
          
            var.update $cursor {
              value = $var.response
                |get:"response":{}
                |get:"result":{}
                |get:"result":{}
                |get:"next_cursor":null
            }
          
            var.update $PARAMS {
              value = $PARAMS|set:"cursor":$cursor
            }
          }
        }
      }
    }
  
    !group {
      stack {
        db.query SOCIAL_MEDIA_CHANNEL {
          where = $db.SOCIAL_MEDIA_CHANNEL.name == "X"
          return = {type: "list"}
          output = ["id", "name"]
        } as $HA_SUPPORTED_MEDIAS_IDS
      
        // Create social media map
        group {
          stack {
            var $MAP {
              value = {}
            }
          
            foreach ($HA_SUPPORTED_MEDIAS_IDS) {
              each as $item {
                var.update $MAP {
                  value = $MAP|set:$item.id:$item.name
                }
              }
            }
          
            var.update $HA_SUPPORTED_MEDIAS_IDS {
              value = $HA_SUPPORTED_MEDIAS_IDS
                |get:"id":null
                |safe_array
                |filter_empty:""
            }
          }
        }
      
        db.query PARTNER_SOCIAL_MEDIA_CHANNEL {
          where = $db.PARTNER_SOCIAL_MEDIA_CHANNEL.social_media_channel in $HA_SUPPORTED_MEDIAS_IDS && ($db.partner_social_media_channel.is_deleted == false || $db.partner_social_media_channel.is_removed == false)
          return = {type: "list"}
          output = ["id", "partner", "social_media_channel", "url"]
        } as $PARTNER_SOCIAL_MEDIA_CHANNEL|get:"url":null
      }
    }
  }

  response = $WORKFLOW_STEP1
}
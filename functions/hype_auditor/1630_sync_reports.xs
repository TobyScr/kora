// Takes the SOCIAL_MEDIA_CHANNELS accepted by HypeAuditor(Youtube,Tiktok,Instagram,X) and request its reports based on the url provided by them.
// 
// In case any of them fail, they are added to the HA_FAILED_REPORTS table so they can be retried later.
function "HypeAuditor/Sync Reports" {
  input {
  }

  stack {
    // Takes the SOCIAL_MEDIA_CHANNELS accepted by HypeAuditor(Youtube,Tiktok,Instagram,X) and request its reports based on the url provided by them.
    // 
    // In case any of them fail, they are added to the HA_FAILED_REPORTS table so they can be retried later.
  
    db.query SOCIAL_MEDIA_CHANNEL {
      where = $db.SOCIAL_MEDIA_CHANNEL.name == "Instagram" || $db.SOCIAL_MEDIA_CHANNEL.name == "TikTok" || $db.SOCIAL_MEDIA_CHANNEL.name == "Youtube" || $db.SOCIAL_MEDIA_CHANNEL.name == "X"
      return = {type: "list"}
      output = ["id", "name"]
    } as $HA_SUPPORTED_MEDIAS_IDS
  
    // Create social media map
    group {
      stack {
        var $MAP {
          value = {}
        }
      
        // Creates a map of shape
        // {database_id: social_name}
      
        foreach ($HA_SUPPORTED_MEDIAS_IDS) {
          each as $item {
            var.update $MAP {
              value = $MAP|set:$item.id:$item.name
            }
          }
        }
      
        // Gets the ids for filtering later
      
        var.update $HA_SUPPORTED_MEDIAS_IDS {
          value = $HA_SUPPORTED_MEDIAS_IDS
            |get:"id":null
            |safe_array
            |filter_empty:""
        }
      }
    }
  
    // Currently limited to avoid requestiong the whole database
    // 
    // MUST UPDATE before going live
  
    db.query PARTNER_SOCIAL_MEDIA_CHANNEL {
      where = $db.PARTNER_SOCIAL_MEDIA_CHANNEL.social_media_channel in $HA_SUPPORTED_MEDIAS_IDS && ($db.partner_social_media_channel.is_deleted == false || $db.partner_social_media_channel.is_removed == false) && $db.PARTNER_SOCIAL_MEDIA_CHANNEL.id >= 1511
      return = {type: "list"}
      output = ["id", "partner", "social_media_channel", "url"]
    } as $PARTNER_SOCIAL_MEDIA_CHANNEL
  
    foreach ($PARTNER_SOCIAL_MEDIA_CHANNEL) {
      each as $media_channel {
        var $social_lookout {
          value = $MAP
            |get:$media_channel.social_media_channel:null
        }
      
        // Extract username/user_id from social media url
      
        switch ($social_lookout) {
          case ("Instagram") {
            var $regex {
              value = "/^(?!.*,)(?:https?:\\/\\/)?(?:www\\.)?instagram\\.com\\/(?!p\\/|reel\\/|stories\\/)([A-Za-z0-9._%-]+)(?=[\\/?#]|$).*$/"
            }
          
            var $lookup_value {
              value = $regex
                |regex_get_all_matches:($media_channel.url|trim:"")
                |last
                |last
            }
          } break
        
          case ("TikTok") {
            var $regex {
              value = "/^(?!.*,)(?:https?:\\/\\/)?(?:www\\.)?tiktok\\.com\\/@([A-Za-z0-9._%-]+)(?=[\\/?#]|$).*$/"
            }
          
            var $lookup_value {
              value = $regex
                |regex_get_all_matches:($media_channel.url|trim:"")
                |last
                |last
            }
          } break
        
          case ("Youtube") {
            var $regex {
              value = "/^(?!.*,)(?:https?:\\/\\/)?(?:www\\.)?youtube\\.com\\/(?:@|channel\\/|user\\/|c\\/)?([A-Za-z0-9._%-]+)(?=[\\/?#]|$).*$/"
            }
          
            var $lookup_value {
              value = $regex
                |regex_get_all_matches:($media_channel.url|trim:"")
                |last
                |last
            }
          } break
        
          case ("X") {
            var $regex {
              value = "/^(?!.*,)(?:https?:\\/\\/)?(?:www\\.|mobile\\.)?(?:twitter\\.com|x\\.com)\\/(?!home\\/?|i\\/|share\\/|search\\/|explore\\/|notifications\\/|messages\\/|settings\\/|tos\\/|privacy\\/)([A-Za-z0-9_%]{1,50})(?=[\\/?#]|$).*$/"
            }
          
            var $lookup_value {
              value = $regex
                |regex_get_all_matches:($media_channel.url|trim:"")
                |last
                |last
            }
          } break
        
          default {
            var $lookup_value {
              value = null
            }
          }
        }
      
        function.run "HypeAuditor/Request Report" {
          input = {
            partner_id    : $media_channel.partner_id
            social_lookout: $social_lookout|to_upper
            lookup_value  : $lookup_value
          }
        } as $response
      
        conditional {
          if ($var.response.response.status == 200) {
            // Handle processing
          
            function.run "HypeAuditor/Parse report response" {
              input = {
                response      : $var.response
                social_lookout: $social_lookout|to_upper
                partner_id    : $media_channel.partner
              }
            }
          }
        
          else {
            // Log unsuccessful result
            // 
            // https://hypeauditor.readme.io/reference/errors
          
            db.add_or_edit HA_FAILED_REPORTS {
              field_name = "partner_social_media_channel_id"
              field_value = $media_channel.id
              data = {
                social_lookout: $social_lookout|to_upper
                lookup_value  : $lookup_value
                code          : $var.response.response.status
                ha_code       : $var.response.response.result.error.code
                description   : $var.response.response.result.error.description
              }
            }
          }
        }
      }
    }
  
    function.run "HypeAuditor/Update Followers Count"
  }

  response = null
  tags = ["hype_auditor"]
}
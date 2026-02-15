function "Migration/test" {
  input {
  }

  stack {
    !db.query PARTNER_SOCIAL_MEDIA_CHANNEL {
      join = {
        SOCIAL_MEDIA_CHANNEL: {
          table: "SOCIAL_MEDIA_CHANNEL"
          where: $db.PARTNER_SOCIAL_MEDIA_CHANNEL.social_media_channel == $db.SOCIAL_MEDIA_CHANNEL.id
        }
      }
    
      where = $db.SOCIAL_MEDIA_CHANNEL.name == "TikTok"
      eval = {media: $db.SOCIAL_MEDIA_CHANNEL.name}
      return = {type: "list"}
      output = ["url", "media"]
    } as $PARTNER_SOCIAL_MEDIA_CHANNEL1
  
    !var $x1 {
      value = []
    }
  
    !foreach ($PARTNER_SOCIAL_MEDIA_CHANNEL1|get:"url":null) {
      each as $item {
        var $regex {
          value = "/^(?!.*,)(?:https?:\\/\\/)?(?:www\\.)?tiktok\\.com\\/@([A-Za-z0-9._%-]+)(?=[\\/?#]|$).*$/"
        }
      
        var $result {
          value = $regex
            |regex_get_all_matches:($item|trim:"")
            |last
            |last
        }
      
        var.update $x1 {
          value = $x1
            |push:([]|push:$item|push:$result)
        }
      }
    }
  
    db.query STRATEGY {
      where = $db.STRATEGY.type == 1
      return = {type: "list"}
    } as $STRATEGY1|set:"type":"Make it Intriguing"
  
    db.bulk.patch STRATEGY {
      items = $STRATEGY1
    } as $STRATEGY
  }

  response = $x1
}
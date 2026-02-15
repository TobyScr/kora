// This function will add the partner topic from the csv (excel) database
function "Add Partner Social Media to database" {
  input {
    int partner_id
    text[] preferred_social_medias filters=trim
    text? website? filters=trim
    text? facebook? filters=trim
    text? instagram? filters=trim
    text? linkedin? filters=trim
    text? telegram? filters=trim
    text? tiktok? filters=trim
    text? x? filters=trim
    text? youtube? filters=trim
    text? vk? filters=trim
    text? ok? filters=trim
    text? other? filters=trim
  }

  stack {
    conditional {
      if ($input.website != null) {
        function.run "Partner Social Media individual logic" {
          input = {
            partner_id             : $input.partner_id
            url                    : $input.website
            preferred_social_medias: $input.preferred_social_medias
            name                   : "Website"
          }
        } as $response
      }
    }
  
    conditional {
      if ($input.facebook != null) {
        function.run "Partner Social Media individual logic" {
          input = {
            partner_id             : $input.partner_id
            url                    : $input.facebook
            preferred_social_medias: $input.preferred_social_medias
            name                   : "Facebook"
          }
        } as $response
      }
    }
  
    conditional {
      if ($input.instagram != null) {
        function.run "Partner Social Media individual logic" {
          input = {
            partner_id             : $input.partner_id
            url                    : $input.instagram
            preferred_social_medias: $input.preferred_social_medias
            name                   : "Instagram"
          }
        } as $response
      }
    }
  
    conditional {
      if ($input.linkedin != null) {
        function.run "Partner Social Media individual logic" {
          input = {
            partner_id             : $input.partner_id
            url                    : $input.linkedin
            preferred_social_medias: $input.preferred_social_medias
            name                   : "Linkedin"
          }
        } as $response
      }
    }
  
    conditional {
      if ($input.telegram != null) {
        function.run "Partner Social Media individual logic" {
          input = {
            partner_id             : $input.partner_id
            url                    : $input.telegram
            preferred_social_medias: $input.preferred_social_medias
            name                   : "Telegram"
          }
        } as $response
      }
    }
  
    conditional {
      if ($input.tiktok != null) {
        function.run "Partner Social Media individual logic" {
          input = {
            partner_id             : $input.partner_id
            url                    : $input.tiktok
            preferred_social_medias: $input.preferred_social_medias
            name                   : "TikTok"
          }
        } as $response
      }
    }
  
    conditional {
      if ($input.x != null) {
        function.run "Partner Social Media individual logic" {
          input = {
            partner_id             : $input.partner_id
            url                    : $input.x
            preferred_social_medias: $input.preferred_social_medias
            name                   : "X"
          }
        } as $response
      }
    }
  
    conditional {
      if ($input.youtube != null) {
        function.run "Partner Social Media individual logic" {
          input = {
            partner_id             : $input.partner_id
            url                    : $input.youtube
            preferred_social_medias: $input.preferred_social_medias
            name                   : "Youtube"
          }
        } as $response
      }
    }
  
    conditional {
      if ($input.vk != null) {
        function.run "Partner Social Media individual logic" {
          input = {
            partner_id             : $input.partner_id
            url                    : $input.vk
            preferred_social_medias: $input.preferred_social_medias
            name                   : "VK"
          }
        } as $response
      }
    }
  
    conditional {
      if ($input.ok != null) {
        function.run "Partner Social Media individual logic" {
          input = {
            partner_id             : $input.partner_id
            url                    : $input.ok
            preferred_social_medias: $input.preferred_social_medias
            name                   : "OK"
          }
        } as $response
      }
    }
  
    conditional {
      if ($input.other != null) {
        function.run "Partner Social Media individual logic" {
          input = {
            partner_id             : $input.partner_id
            url                    : $input.other
            preferred_social_medias: $input.preferred_social_medias
            name                   : "Other"
          }
        } as $response
      }
    }
  }

  response = "Partner social media logic finished!"
  tags = ["partner-database"]
}
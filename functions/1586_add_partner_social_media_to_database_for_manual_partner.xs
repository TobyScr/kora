// This function will add the partner topic for the manual partner of endpoint.
function "Add Partner Social Media to database for manual partner" {
  input {
    int partner_id
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
        function.run "Partner Social Media individual logic for manual partner" {
          input = {
            partner_id: $input.partner_id
            url       : $input.website
            name      : "Website"
          }
        } as $response
      }
    }
  
    conditional {
      if ($input.facebook != null) {
        function.run "Partner Social Media individual logic for manual partner" {
          input = {
            partner_id: $input.partner_id
            url       : $input.facebook
            name      : "Facebook"
          }
        } as $response
      }
    }
  
    conditional {
      if ($input.instagram != null) {
        function.run "Partner Social Media individual logic for manual partner" {
          input = {
            partner_id: $input.partner_id
            url       : $input.instagram
            name      : "Instagram"
          }
        } as $response
      }
    }
  
    conditional {
      if ($input.linkedin != null) {
        function.run "Partner Social Media individual logic for manual partner" {
          input = {
            partner_id: $input.partner_id
            url       : $input.linkedin
            name      : "Linkedin"
          }
        } as $response
      }
    }
  
    conditional {
      if ($input.telegram != null) {
        function.run "Partner Social Media individual logic for manual partner" {
          input = {
            partner_id: $input.partner_id
            url       : $input.telegram
            name      : "Telegram"
          }
        } as $response
      }
    }
  
    conditional {
      if ($input.tiktok != null) {
        function.run "Partner Social Media individual logic for manual partner" {
          input = {
            partner_id: $input.partner_id
            url       : $input.tiktok
            name      : "TikTok"
          }
        } as $response
      }
    }
  
    conditional {
      if ($input.x != null) {
        function.run "Partner Social Media individual logic for manual partner" {
          input = {
            partner_id: $input.partner_id
            url       : $input.x
            name      : "X"
          }
        } as $response
      }
    }
  
    conditional {
      if ($input.youtube != null) {
        function.run "Partner Social Media individual logic for manual partner" {
          input = {
            partner_id: $input.partner_id
            url       : $input.youtube
            name      : "Youtube"
          }
        } as $response
      }
    }
  
    conditional {
      if ($input.vk != null) {
        function.run "Partner Social Media individual logic for manual partner" {
          input = {
            partner_id: $input.partner_id
            url       : $input.vk
            name      : "VK"
          }
        } as $response
      }
    }
  
    conditional {
      if ($input.ok != null) {
        function.run "Partner Social Media individual logic for manual partner" {
          input = {
            partner_id: $input.partner_id
            url       : $input.ok
            name      : "OK"
          }
        } as $response
      }
    }
  
    conditional {
      if ($input.other != null) {
        function.run "Partner Social Media individual logic for manual partner" {
          input = {
            partner_id: $input.partner_id
            url       : $input.other
            name      : "Other"
          }
        } as $response
      }
    }
  }

  response = "Partner social media logic finished!"
  tags = ["partner-database"]
}
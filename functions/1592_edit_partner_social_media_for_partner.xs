// This function will edit the partner social media for the partner of endpoint.
function "Edit Partner Social Media for partner" {
  input {
    int partner_id?
    text website_url? filters=trim
    text facebook_url? filters=trim
    text instagram_url? filters=trim
    text linkedin_url? filters=trim
    text telegram_url? filters=trim
    text tiktok_url? filters=trim
    text x_url? filters=trim
    text youtube_url? filters=trim
    text vk_url? filters=trim
    text ok_url? filters=trim
    text other_url? filters=trim
  }

  stack {
    db.query SOCIAL_MEDIA_CHANNEL {
      where = `$db.SOCIAL_MEDIA_CHANNEL.name ilike "Website"`
      return = {type: "list"}
    } as $website
  
    function.run "Edit Partner Social Media individual logic" {
      input = {
        partner_id     : $input.partner_id
        url            : $input.website_url
        social_media_id: $website.0.id
      }
    } as $edit_website
  
    db.query SOCIAL_MEDIA_CHANNEL {
      where = `$db.SOCIAL_MEDIA_CHANNEL.name ilike "Facebook"`
      return = {type: "list"}
    } as $facebook
  
    function.run "Edit Partner Social Media individual logic" {
      input = {
        partner_id     : $input.partner_id
        url            : $input.facebook_url
        social_media_id: $facebook.0.id
      }
    } as $edit_facebook
  
    db.query SOCIAL_MEDIA_CHANNEL {
      where = `$db.SOCIAL_MEDIA_CHANNEL.name ilike "Instagram"`
      return = {type: "list"}
    } as $instagram
  
    function.run "Edit Partner Social Media individual logic" {
      input = {
        partner_id     : $input.partner_id
        url            : $input.instagram_url
        social_media_id: $instagram.0.id
      }
    } as $edit_instagram
  
    db.query SOCIAL_MEDIA_CHANNEL {
      where = `$db.SOCIAL_MEDIA_CHANNEL.name ilike "Linkedin"`
      return = {type: "list"}
    } as $linkedin
  
    function.run "Edit Partner Social Media individual logic" {
      input = {
        partner_id     : $input.partner_id
        url            : $input.linkedin_url
        social_media_id: $linkedin.0.id
      }
    } as $edit_linkedin
  
    db.query SOCIAL_MEDIA_CHANNEL {
      where = `$db.SOCIAL_MEDIA_CHANNEL.name ilike "Telegram"`
      return = {type: "list"}
    } as $telegram
  
    function.run "Edit Partner Social Media individual logic" {
      input = {
        partner_id     : $input.partner_id
        url            : $input.telegram_url
        social_media_id: $telegram.0.id
      }
    } as $edit_telegram
  
    db.query SOCIAL_MEDIA_CHANNEL {
      where = `$db.SOCIAL_MEDIA_CHANNEL.name ilike "TikTok"`
      return = {type: "list"}
    } as $tiktok
  
    function.run "Edit Partner Social Media individual logic" {
      input = {
        partner_id     : $input.partner_id
        url            : $input.tiktok_url
        social_media_id: $tiktok.0.id
      }
    } as $edit_tiktok
  
    db.query SOCIAL_MEDIA_CHANNEL {
      where = `$db.SOCIAL_MEDIA_CHANNEL.name ilike "X"`
      return = {type: "list"}
    } as $x
  
    function.run "Edit Partner Social Media individual logic" {
      input = {
        partner_id     : $input.partner_id
        url            : $input.x_url
        social_media_id: $x.0.id
      }
    } as $edit_x
  
    db.query SOCIAL_MEDIA_CHANNEL {
      where = `$db.SOCIAL_MEDIA_CHANNEL.name ilike "Youtube"`
      return = {type: "list"}
    } as $youtube
  
    function.run "Edit Partner Social Media individual logic" {
      input = {
        partner_id     : $input.partner_id
        url            : $input.youtube_url
        social_media_id: $youtube.0.id
      }
    } as $edit_youtube
  
    db.query SOCIAL_MEDIA_CHANNEL {
      where = `$db.SOCIAL_MEDIA_CHANNEL.name ilike "VK"`
      return = {type: "list"}
    } as $vk
  
    function.run "Edit Partner Social Media individual logic" {
      input = {
        partner_id     : $input.partner_id
        url            : $input.vk_url
        social_media_id: $vk.0.id
      }
    } as $edit_vk
  
    db.query SOCIAL_MEDIA_CHANNEL {
      where = `$db.SOCIAL_MEDIA_CHANNEL.name ilike "OK"`
      return = {type: "list"}
    } as $ok
  
    function.run "Edit Partner Social Media individual logic" {
      input = {
        partner_id     : $input.partner_id
        url            : $input.ok_url
        social_media_id: $ok.0.id
      }
    } as $edit_ok
  
    db.query SOCIAL_MEDIA_CHANNEL {
      where = `$db.SOCIAL_MEDIA_CHANNEL.name ilike "Other"`
      return = {type: "list"}
    } as $other
  
    function.run "Edit Partner Social Media individual logic" {
      input = {
        partner_id     : $input.partner_id
        url            : $input.other_url
        social_media_id: $other.0.id
      }
    } as $edit_other
  }

  response = "PARTNER social medias logic finished!"
  tags = ["partner-database"]
}
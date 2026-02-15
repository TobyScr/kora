// This endpoint will allow the admin to edit the partner details.
query partner verb=PATCH {
  api_group = "Partner"
  auth = "USER"

  input {
    text name filters=trim
    text? description? filters=trim
    int entity_type
    int country
    int[1:] languages
    text? website_url? filters=trim
    text? facebook_url? filters=trim
    text? instagram_url? filters=trim
    text? linkedin_url? filters=trim
    text? telegram_url? filters=trim
    text? tiktok_url? filters=trim
    text? x_url? filters=trim
    text? youtube_url? filters=trim
    text? vk_url? filters=trim
    text? ok_url? filters=trim
    text? other_url? filters=trim
    int total_followers
    int[1:] audiences
    int[1:] topics
    text? past_engagement_link? filters=trim
    text phone_number? filters=trim
    int partner_id
    text email? filters=trim
  }

  stack {
    db.get USER {
      field_name = "id"
      field_value = $auth.id
    } as $user_request
  
    precondition ($user_request != null) {
      error_type = "notfound"
      error = "User not found."
    }
  
    db.get PARTNER {
      field_name = "id"
      field_value = $input.partner_id
    } as $PARTNER_main
  
    precondition ($PARTNER_main != null) {
      error_type = "notfound"
      error = "Partner not found."
    }
  
    db.edit PARTNER {
      field_name = "id"
      field_value = $input.partner_id
      data = {
        name                            : $input.name
        description                     : $input.description
        past_zinc_engagement            : ($input.past_engagement_link != null) ? true : false
        past_zinc_engagement_description: $input.past_engagement_link
        audience_follower_count         : $input.total_followers
        last_updated_at                 : now
      }
    } as $PARTNER1
  
    db.add PARTNER_LOGS {
      data = {
        created_at: "now"
        changed_by: $auth.id
        action    : "edit"
        partner_id: $input.partner_id
      }
    } as $PARTNER_LOGS1
  
    function.run "" {
      input = {
        partner_id  : $input.partner_id
        entity_types: []|push:$input.entity_type
      }
    } as $edit_entity
  
    function.run "" {
      input = {
        partner_id: $input.partner_id
        audiences : $input.audiences
      }
    } as $edit_partner
  
    function.run "" {
      input = {
        partner_id: $input.partner_id
        countries : []|push:$input.country
      }
    } as $edit_country
  
    function.run "" {
      input = {
        partner_id: $input.partner_id
        languages : $input.languages
      }
    } as $edit_language
  
    function.run "" {
      input = {partner_id: $input.partner_id, topics: $input.topics}
    } as $edit_topic
  
    function.run "Edit Partner Contact for partner" {
      input = {
        partner_id  : $input.partner_id
        phone_number: $input.phone_number
        email       : $input.email
      }
    } as $edit_contact
  
    function.run "Edit Partner Social Media for partner" {
      input = {
        partner_id   : $input.partner_id
        website_url  : $input.website_url
        facebook_url : $input.facebook_url
        instagram_url: $input.instagram_url
        linkedin_url : $input.linkedin_url
        telegram_url : $input.telegram_url
        tiktok_url   : $input.tiktok_url
        x_url        : $input.x_url
        youtube_url  : $input.youtube_url
        vk_url       : $input.vk_url
        ok_url       : $input.ok_url
        other_url    : $input.other_url
      }
    } as $edit_social
  }

  response = "Partner info edited."
}
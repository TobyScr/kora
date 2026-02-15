// This endpoint will allow the admin to add a new partner to KORA.
query partner verb=POST {
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
    text email? filters=trim
    int user_id?
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
  
    db.add PARTNER {
      data = {
        created_at                            : "now"
        name                                  : $input.name
        description                           : $input.description
        geographical_focus                    : null
        past_zinc_engagement                  : ($input.past_engagement_link != null) ? true : false
        past_zinc_engagement_description      : $input.past_engagement_link
        preferred_incentives_for_collaboration: null
        preferred_communication_channel       : []
        partner_languages                     : []
        partner_audiences                     : []
        partner_topics                        : []
        partner_social_medias                 : []
        partner_entity_types                  : []
        partner_countries                     : []
        partner_contact_details               : []
        audience_follower_count               : $input.total_followers
        audience_general_description          : "N/A"
        engagement_rate                       : null
        engagement_rate_classification        : null
        is_deleted                            : false
        last_updated_at                       : now
        created_by                            : $input.user_id
      }
    } as $PARTNER_original
  
    db.add PARTNER_LOGS {
      data = {
        created_at: "now"
        changed_by: $auth.id
        action    : "create"
        partner_id: $PARTNER_original.id
      }
    } as $PARTNER_LOGS1
  
    function.run "" {
      input = {
        partner_id  : $PARTNER_original.id
        entity_types: []|push:$input.entity_type
      }
    } as $add_entity
  
    function.run "" {
      input = {
        partner_id: $PARTNER_original.id
        countries : []|push:$input.country
      }
    } as $add_country
  
    function.run "" {
      input = {
        partner_id: $PARTNER_original.id
        languages : $input.languages
      }
    } as $add_languages
  
    function.run "Add Partner Social Media to database for manual partner" {
      input = {
        partner_id: $PARTNER_original.id
        website   : $input.website_url
        facebook  : $input.facebook_url
        instagram : $input.instagram_url
        linkedin  : $input.linkedin_url
        telegram  : $input.telegram_url
        tiktok    : $input.tiktok_url
        x         : $input.x_url
        youtube   : $input.youtube_url
        vk        : $input.vk_url
        ok        : $input.ok_url
        other     : $input.other_url
      }
    } as $add_socials
  
    function.run "" {
      input = {
        partner_id: $PARTNER_original.id
        audiences : $input.audiences
      }
    } as $add_audiences
  
    function.run "" {
      input = {
        partner_id     : $PARTNER_original.id
        topic_free_text: ""
        topics         : $input.topics
      }
    } as $add_topics
  
    function.run "Add Partner Contact to database for manual partner" {
      input = {
        partner_id  : $PARTNER_original.id
        phone_number: $input.phone_number
        email       : $input.email
      }
    } as $add_contact
  }

  response = "New partner added"
}
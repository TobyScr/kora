query "partner/{partner-id}" verb=GET {
  api_group = "Partner"
  auth = "USER"

  input {
    int partner_id
  }

  stack {
    db.get PARTNER {
      field_name = "id"
      field_value = $input.partner_id
      addon = [
        {
          name : "PARTNER_SOCIAL_MEDIA_CHANNEL"
          input: {PARTNER_SOCIAL_MEDIA_CHANNEL_id: $output.$this}
          addon: [
            {
              name : "SOCIAL_MEDIA_CHANNEL"
              input: {SOCIAL_MEDIA_CHANNEL_id: $output.social_media_channel}
              as   : "_social_media_channel"
            }
          ]
          as   : "preferred_communication_channel._preferred_social_media"
        }
        {
          name : "ENTITY_TYPE"
          input: {ENTITY_TYPE_id: $output.$this}
          as   : "partner_entity_types._entity"
        }
        {
          name : "COUNTRY"
          input: {COUNTRY_id: $output.$this}
          as   : "partner_countries._country"
        }
        {
          name : "LANGUAGE"
          input: {LANGUAGE_id: $output.$this}
          as   : "partner_languages._language"
        }
        {
          name : "TOPIC"
          input: {TOPIC_id: $output.$this}
          as   : "partner_topics._topic"
        }
        {
          name : "AUDIENCE"
          input: {AUDIENCE_id: $output.$this}
          as   : "partner_audiences._audience"
        }
        {
          name : "PARTNER_CONTACT_DETAIL"
          input: {PARTNER_CONTACT_DETAIL_id: $output.$this}
          as   : "partner_contact_details._partner_contact_detail"
        }
      ]
    } as $PARTNER1
  
    precondition ($PARTNER1 != null) {
      error_type = "notfound"
      error = "Partner not found."
    }
  
    precondition ($PARTNER1.is_deleted == false) {
      error_type = "badrequest"
      error = "Partner already deleted."
    }
  
    var $result {
      value = $PARTNER1
    }
  
    function.run "Query Partner Social Media Channel table" {
      input = {partner_id: $input.partner_id}
    } as $partnerSocialMedias
  
    var.update $result {
      value = $result
        |set:"_partner_social_medias":$partnerSocialMedias
    }
  }

  response = $result
}
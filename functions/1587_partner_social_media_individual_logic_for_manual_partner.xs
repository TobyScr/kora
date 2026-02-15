function "Partner Social Media individual logic for manual partner" {
  input {
    int partner_id
    text url filters=trim
    text name? filters=trim
  }

  stack {
    db.get PARTNER {
      field_name = "id"
      field_value = $input.partner_id
    } as $PARTNER_main
  
    db.query SOCIAL_MEDIA_CHANNEL {
      where = `$db.SOCIAL_MEDIA_CHANNEL.name ilike $input.name`
      return = {type: "list"}
    } as $SOCIAL_MEDIA_CHANNEL1
  
    conditional {
      if ($SOCIAL_MEDIA_CHANNEL1 != null) {
        db.add PARTNER_SOCIAL_MEDIA_CHANNEL {
          data = {
            created_at          : "now"
            partner             : $input.partner_id
            social_media_channel: $SOCIAL_MEDIA_CHANNEL1.0.id
            url                 : $input.url
            follower_count      : null
          }
        } as $PARTNER_SOCIAL_MEDIA_CHANNEL1
      
        db.edit PARTNER {
          field_name = "id"
          field_value = $input.partner_id
          data = {
            preferred_communication_channel: $PARTNER_main.preferred_communication_channel|push:$PARTNER_SOCIAL_MEDIA_CHANNEL1.id
            partner_social_medias          : $PARTNER_main.partner_social_medias|push:$SOCIAL_MEDIA_CHANNEL1.0.id
          }
        } as $PARTNER1
      }
    }
  }

  response = "Social Media individual logic finished"
}
// This function will edit social media of partner individually.
function "Edit Partner Social Media individual logic" {
  input {
    int partner_id?
    text url? filters=trim
    int social_media_id?
  }

  stack {
    db.get PARTNER {
      field_name = "id"
      field_value = $input.partner_id
    } as $PARTNER_check
  
    db.query PARTNER_SOCIAL_MEDIA_CHANNEL {
      where = $db.PARTNER_SOCIAL_MEDIA_CHANNEL.partner == $input.partner_id && $db.PARTNER_SOCIAL_MEDIA_CHANNEL.is_removed == false && $db.PARTNER_SOCIAL_MEDIA_CHANNEL.social_media_channel == $input.social_media_id
      return = {type: "list"}
    } as $PARTNER_SOCIAL_MEDIA_CHANNEL_main
  
    conditional {
      if ($PARTNER_SOCIAL_MEDIA_CHANNEL_main != null && $input.url != null) {
        db.edit PARTNER_SOCIAL_MEDIA_CHANNEL {
          field_name = "id"
          field_value = $PARTNER_SOCIAL_MEDIA_CHANNEL_main.0.id
          data = {url: $input.url}
        } as $PARTNER_SOCIAL_MEDIA_CHANNEL2
      }
    }
  
    conditional {
      if ($PARTNER_SOCIAL_MEDIA_CHANNEL_main != null && $input.url == null) {
        db.edit PARTNER_SOCIAL_MEDIA_CHANNEL {
          field_name = "id"
          field_value = $PARTNER_SOCIAL_MEDIA_CHANNEL_main.0.id
          data = {is_removed: true}
        } as $PARTNER_SOCIAL_MEDIA_CHANNEL3
      
        db.edit PARTNER {
          field_name = "id"
          field_value = $input.partner_id
          data = {
            preferred_communication_channel: $PARTNER_check.preferred_communication_channel|remove:$PARTNER_SOCIAL_MEDIA_CHANNEL3.id:"":true
            partner_social_medias          : $PARTNER_check.partner_social_medias|remove:$input.social_media_id:"":true
          }
        } as $PARTNER1
      }
    }
  
    conditional {
      if ($PARTNER_SOCIAL_MEDIA_CHANNEL_main == null && $input.url != null) {
        db.add PARTNER_SOCIAL_MEDIA_CHANNEL {
          data = {
            created_at          : "now"
            partner             : $input.partner_id
            social_media_channel: $input.social_media_id
            url                 : $input.url
            follower_count      : null
            is_deleted          : false
            is_removed          : false
          }
        } as $PARTNER_SOCIAL_MEDIA_CHANNEL_added
      
        db.get PARTNER {
          field_name = "id"
          field_value = $input.partner_id
        } as $PARTNER2
      
        db.edit PARTNER {
          field_name = "id"
          field_value = $input.partner_id
          data = {
            preferred_communication_channel: $PARTNER2.preferred_communication_channel|push:$PARTNER_SOCIAL_MEDIA_CHANNEL_added.id
            partner_social_medias          : $PARTNER2.partner_social_medias|push:$input.social_media_id
          }
        } as $PARTNER3
      }
    }
  }

  response = "PARTNER social media individual logic finished!"
  tags = ["partner-database"]
}
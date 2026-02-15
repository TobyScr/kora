addon PARTNER_SOCIAL_MEDIA_CHANNEL {
  input {
    int PARTNER_SOCIAL_MEDIA_CHANNEL_id? {
      table = "PARTNER_SOCIAL_MEDIA_CHANNEL"
    }
  }

  stack {
    db.query PARTNER_SOCIAL_MEDIA_CHANNEL {
      where = $db.PARTNER_SOCIAL_MEDIA_CHANNEL.id == $input.PARTNER_SOCIAL_MEDIA_CHANNEL_id
      return = {type: "single"}
    }
  }
}
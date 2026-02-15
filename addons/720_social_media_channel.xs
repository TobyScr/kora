addon SOCIAL_MEDIA_CHANNEL {
  input {
    int SOCIAL_MEDIA_CHANNEL_id? {
      table = "SOCIAL_MEDIA_CHANNEL"
    }
  }

  stack {
    db.query SOCIAL_MEDIA_CHANNEL {
      where = $db.SOCIAL_MEDIA_CHANNEL.id == $input.SOCIAL_MEDIA_CHANNEL_id
      return = {type: "single"}
    }
  }
}
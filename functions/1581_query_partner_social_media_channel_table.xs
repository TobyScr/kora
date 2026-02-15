// This function will query data from Partner Language table based on partner_id.
function "Query Partner Social Media Channel table" {
  input {
    int partner_id
  }

  stack {
    db.query PARTNER_SOCIAL_MEDIA_CHANNEL {
      where = $db.PARTNER_SOCIAL_MEDIA_CHANNEL.partner ==? $input.partner_id
      return = {type: "list"}
      addon = [
        {
          name : "SOCIAL_MEDIA_CHANNEL"
          input: {SOCIAL_MEDIA_CHANNEL_id: $output.social_media_channel}
          as   : "_social_media_channel"
        }
      ]
    } as $PARTNER_SOCIAL_MEDIA_CHANNEL1
  }

  response = $PARTNER_SOCIAL_MEDIA_CHANNEL1
  tags = ["partner-language"]
}
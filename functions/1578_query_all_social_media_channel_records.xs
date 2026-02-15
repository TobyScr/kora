function "Query All Social Media Channel records" {
  input {
  }

  stack {
    db.query SOCIAL_MEDIA_CHANNEL {
      return = {type: "list"}
    } as $SOCIAL_MEDIA_CHANNEL1
  }

  response = $SOCIAL_MEDIA_CHANNEL1
}
addon CONTEXT_MEDIA {
  input {
    uuid CONTEXT_MEDIA_id? {
      table = "CONTEXT_MEDIA"
    }
  }

  stack {
    db.query CONTEXT_MEDIA {
      where = $db.CONTEXT_MEDIA.id == $input.CONTEXT_MEDIA_id
      return = {type: "single"}
    }
  }
}
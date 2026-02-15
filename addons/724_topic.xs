addon TOPIC {
  input {
    int TOPIC_id? {
      table = "TOPIC"
    }
  }

  stack {
    db.query TOPIC {
      where = $db.TOPIC.id == $input.TOPIC_id
      return = {type: "single"}
    }
  }
}
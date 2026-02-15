query "topic-by-keyword" verb=GET {
  api_group = "Topic"
  auth = "USER"

  input {
    text keyword? filters=trim
  }

  stack {
    db.query TOPIC {
      where = ($db.TOPIC.name|to_lower) includes $input.keyword
      return = {type: "list"}
    } as $model
  }

  response = $model
}
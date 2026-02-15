function "Query All Topic records" {
  input {
  }

  stack {
    db.query TOPIC {
      return = {type: "list"}
    } as $TOPIC1
  }

  response = $TOPIC1
}
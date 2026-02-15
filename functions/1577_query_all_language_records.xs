function "Query All Language records" {
  input {
  }

  stack {
    db.query LANGUAGE {
      return = {type: "list"}
    } as $LANGUAGE1
  }

  response = $LANGUAGE1
}
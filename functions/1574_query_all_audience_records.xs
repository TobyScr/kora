function "Query All Audience records" {
  input {
  }

  stack {
    db.query AUDIENCE {
      sort = {AUDIENCE.name: "asc"}
      return = {type: "list"}
    } as $AUDIENCE1
  }

  response = $AUDIENCE1
}
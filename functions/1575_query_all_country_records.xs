function "Query All Country records" {
  input {
  }

  stack {
    db.query COUNTRY {
      return = {type: "list"}
    } as $COUNTRY1
  }

  response = $COUNTRY1
}
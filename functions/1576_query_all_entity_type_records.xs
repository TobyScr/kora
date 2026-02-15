function "Query All Entity Type records" {
  input {
  }

  stack {
    db.query ENTITY_TYPE {
      return = {type: "list"}
    } as $ENTITY_TYPE1
  }

  response = $ENTITY_TYPE1
}
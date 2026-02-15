query "audience-by-keyword" verb=GET {
  api_group = "Audience"
  auth = "USER"

  input {
    text keyword? filters=trim
  }

  stack {
    db.query AUDIENCE {
      where = ($db.AUDIENCE.name|to_lower) includes $input.keyword
      return = {type: "list"}
    } as $model
  }

  response = $model
}
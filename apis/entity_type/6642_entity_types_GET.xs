// This endpoint returns the list of Entity Types.
query "entity-types" verb=GET {
  api_group = "Entity Type"
  auth = "USER"

  input {
  }

  stack {
    function.run "Query All Entity Type records" as $response
  }

  response = $var.response
  tags = ["entity-type"]
}
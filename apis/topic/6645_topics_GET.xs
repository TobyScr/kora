// This endpoint returns the list of Topics.
query topics verb=GET {
  api_group = "Topic"
  auth = "USER"

  input {
  }

  stack {
    function.run "Query All Topic records" as $response
  }

  response = $var.response
  tags = ["topic"]
}
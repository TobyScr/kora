// This endpoint returns the list of Audiences.
query audiences verb=GET {
  api_group = "Audience"
  auth = "USER"

  input {
  }

  stack {
    function.run "Query All Audience records" as $response
  }

  response = $var.response
  tags = ["audience"]
}
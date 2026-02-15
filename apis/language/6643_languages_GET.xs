// This endpoint returns the list of Languages.
query languages verb=GET {
  api_group = "Language"
  auth = "USER"

  input {
  }

  stack {
    function.run "Query All Language records" as $response
  }

  response = $var.response
  tags = ["language"]
}
// This endpoint returns the list of Countries.
query countries verb=GET {
  api_group = "Country"
  auth = "USER"

  input {
  }

  stack {
    function.run "Query All Country records" as $response
  }

  response = $var.response
  tags = ["country"]
}
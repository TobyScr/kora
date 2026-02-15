// This endpoint returns the list of Social Media Channels.
query "social-media-channels" verb=GET {
  api_group = "Social Media Channel"
  auth = "USER"

  input {
  }

  stack {
    function.run "Query All Social Media Channel records" as $response
  }

  response = $var.response
  tags = ["social-media-channel"]
}
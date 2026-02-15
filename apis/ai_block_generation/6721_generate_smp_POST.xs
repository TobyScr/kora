query generate_smp verb=POST {
  api_group = "AI Block Generation"

  input {
    int intervention_id?
  }

  stack {
    function.run "apiKey/validate" {
      input = {
        public: $env.$http_headers["X-Client"]
        secret: $env.$http_headers["X-Secret"]
      }
    } as $func1
  
    function.run "n8n/design/generate_smp" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  }

  response = "started"
}
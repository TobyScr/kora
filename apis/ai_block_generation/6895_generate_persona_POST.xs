query generate_persona verb=POST {
  api_group = "AI Block Generation"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    !function.run "apiKey/validate" {
      input = {
        public: $env.$http_headers["X-Client"]
        secret: $env.$http_headers["X-Secret"]
      }
    } as $func1
  
    function.run "n8n/understand/generate_persona" {
      input = {intervention_id: $input.intervention_id}
    } as $func2
  }

  response = "started"
}
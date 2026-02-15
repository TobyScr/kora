query generate_behavioural_objective verb=POST {
  api_group = "AI Block Generation"

  input {
    int intervention_id?
  }

  stack {
    !function.run "apiKey/validate" {
      input = {
        public: $env.$http_headers["X-Client"]
        secret: $env.$http_headers["X-Secret"]
      }
    } as $func1
  
    function.run "n8n/understand/generate_behavioural_objective" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  }

  response = $func1
}
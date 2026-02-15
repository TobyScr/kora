query generate_research_insights verb=POST {
  api_group = "AI Block Generation"
  auth = "USER"

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
  
    function.run "n8n/understand/generate_research_insights" {
      input = {intervention_id: $input.intervention_id}
    } as $func2
  }

  response = {status: "started"}
}
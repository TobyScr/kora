query get_persona verb=GET {
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
  
    function.run "n8n/Intervention Info/Get Persona For Img Gen" {
      input = {intervention_id: $input.intervention_id}
    } as $func2
  }

  response = $func2
}
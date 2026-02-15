query get_persona_clean verb=GET {
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
  
    function.run "" {
      input = {
        intervention_id  : $input.intervention_id
        intervention_info: null
        confirmed_steps  : []
      }
    } as $func1
  }

  response = $func1
}
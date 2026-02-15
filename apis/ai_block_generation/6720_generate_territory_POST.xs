query generate_territory verb=POST {
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
  
    db.get INTERVENTION {
      field_name = "id"
      field_value = $input.intervention_id
    } as $INTERVENTION1
  
    function.run "n8n/design/generate_territory" {
      input = {intervention_id: $input.intervention_id}
    } as $func2
  
    !conditional {
      if ($INTERVENTION1.current_step == 24) {
      }
    
      else {
        function.run "n8n/design/generate_narrative_framework" {
          input = {intervention_id: $input.intervention_id}
        } as $func1
      }
    }
  }

  response = "started"
}
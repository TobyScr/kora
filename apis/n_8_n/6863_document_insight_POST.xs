// Add DOCUMENT_INSIGHT record
query document_insight verb=POST {
  api_group = "n8n"
  auth = "USER"

  input {
    dblink {
      table = "DOCUMENT_INSIGHT"
    }
  }

  stack {
    function.run "apiKey/validate" {
      input = {
        public: $env.$http_headers["X-Client"]
        secret: $env.$http_headers["X-Secret"]
      }
    } as $func1
  
    function.run "Utils/Confuse commas in text array" {
      input = {text_array: $input.keywords}
    } as $keywords_confused
  
    db.add DOCUMENT_INSIGHT {
      data = {
        created_at     : "now"
        insight        : $input.insight
        source         : $input.source
        page           : $input.page
        sectionTitle   : $input.sectionTitle
        keywords       : $keywords_confused
        importance     : $input.importance
        intervention_id: $input.intervention_id
        description    : $input.description
      }
    } as $document_insight
  }

  response = $document_insight
}
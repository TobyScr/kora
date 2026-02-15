// Delete DOCUMENT_INSIGHT record.
query "document_insight/{document_insight_id}" verb=DELETE {
  api_group = "n8n"
  auth = "USER"

  input {
    uuid document_insight_id?
  }

  stack {
    function.run "apiKey/validate" {
      input = {
        public: $env.$http_headers["X-Client"]
        secret: $env.$http_headers["X-Secret"]
      }
    } as $func1
  
    db.del DOCUMENT_INSIGHT {
      field_name = "id"
      field_value = $input.document_insight_id
    }
  }

  response = null
}
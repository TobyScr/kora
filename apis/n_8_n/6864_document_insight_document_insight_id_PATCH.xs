// Edit DOCUMENT_INSIGHT record
query "document_insight/{document_insight_id}" verb=PATCH {
  api_group = "n8n"
  auth = "USER"

  input {
    uuid document_insight_id?
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
  
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    function.run "Utils/Confuse commas in text array" {
      input = {text_array: $input.keywords}
    } as $keywords_confused
  
    var $item {
      value = `$input|pick:($raw_input|keys)`
        |filter_null
        |filter_empty_text
        |set_ifnotempty:"keywords":$keywords_confused
    }
  
    db.patch DOCUMENT_INSIGHT {
      field_name = "id"
      field_value = $input.document_insight_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $document_insight
  }

  response = $document_insight
}
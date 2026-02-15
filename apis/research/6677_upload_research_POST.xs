query upload_research verb=POST {
  api_group = "Research"
  auth = "USER"

  input {
    text name? filters=trim
    text url? filters=trim
    text type? filters=trim
  }

  stack {
    function.run "apiKey/validate" {
      input = {
        public: $env.$http_headers["X-Client"]
        secret: $env.$http_headers["X-Secret"]
      }
    } as $func1
  
    db.add "" {
      data = {
        created_at: "now"
        type      : $input.type
        name      : $input.name
        status    : "uploaded"
        url       : $input.url
      }
    } as $RESEARCH_FILES1
  
    function.run "n8n/n8n Start File RAG Pipeline" {
      input = {
        name: $input.name
        url : $input.url
        uuid: $RESEARCH_FILES1.id
      }
    } as $func1
  }

  response = $RESEARCH_FILES1
  tags = ["potentially inactive"]
}
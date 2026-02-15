function "n8n/n8n Start File RAG Pipeline" {
  input {
    text name? filters=trim
    text url? filters=trim
    uuid? uuid?
  }

  stack {
    api.request {
      url = "/webhook/996fe58c-461f-4667-aace-56555a482b4c"
      method = "POST"
      params = {}
        |set:"name":$input.name
        |set:"url":$input.url
        |set:"uuid":$input.uuid
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  
    db.edit "" {
      field_name = "id"
      field_value = $input.uuid
      data = {status: $api1.response.result}
    } as $RESEARCH_FILES1
  }

  response = $api1
}
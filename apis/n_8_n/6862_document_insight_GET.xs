// Query all DOCUMENT_INSIGHT records
query document_insight verb=GET {
  api_group = "n8n"
  auth = "USER"

  input {
  }

  stack {
    db.query DOCUMENT_INSIGHT {
      return = {type: "list"}
    } as $document_insight
  }

  response = $document_insight
}
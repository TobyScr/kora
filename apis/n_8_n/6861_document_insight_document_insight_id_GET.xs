// Get DOCUMENT_INSIGHT record
query "document_insight/{document_insight_id}" verb=GET {
  api_group = "n8n"
  auth = "USER"

  input {
    uuid document_insight_id?
  }

  stack {
    db.get DOCUMENT_INSIGHT {
      field_name = "id"
      field_value = $input.document_insight_id
    } as $document_insight
  
    precondition ($document_insight != null) {
      error_type = "notfound"
      error = "Not Found."
    }
  }

  response = $document_insight
}
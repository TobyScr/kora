function "n8n/understand/generate_research_document_insights" {
  input {
    int intervention_id?
  }

  stack {
    db.schema DOCUMENT_INSIGHT {
      path = ""
    } as $DOCUMENT_INSIGHT
  
    api.request {
      url = "/webhook-test/generate_document_insight"
      method = "POST"
      params = {}
        |set:"xano_schema":$DOCUMENT_INSIGHT
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
      headers = []
        |push:"Content-Type: application/json"
    } as $api
  }

  response = $DOCUMENT_INSIGHT
}
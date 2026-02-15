function "n8n/understand/generate_single_research_insights" {
  input {
    int intervention_id?
  }

  stack {
    db.schema RESEARCH_INSIGHTS {
      path = ""
    } as $RESEARCH_INSIGHTS
  
    api.request {
      url = "/webhook/generate_single_insight"
      method = "POST"
      params = {}
        |set:"xano_schema":$RESEARCH_INSIGHTS
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $api1
}
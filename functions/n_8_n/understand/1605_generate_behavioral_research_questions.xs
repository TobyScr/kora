function "n8n/understand/generate_behavioral_research_questions" {
  input {
    int intervention_id?
  }

  stack {
    db.schema "" {
      path = ""
    } as $BEHAVIORAL_RESEARCH_QUESTIONS1
  
    api.request {
      url = "/webhook/generate_research_questions"
      method = "POST"
      params = {}
        |set:"xano_schema":$BEHAVIORAL_RESEARCH_QUESTIONS1
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $api1
}
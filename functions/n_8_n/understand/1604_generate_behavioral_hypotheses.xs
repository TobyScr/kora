function "n8n/understand/generate_behavioral_hypotheses" {
  input {
    int intervention_id?
  }

  stack {
    db.schema "" {
      path = ""
    } as $BEHAVIORAL_HYPOTHESES1
  
    api.request {
      url = "/webhook/generate_behavior_hypotheses"
      method = "POST"
      params = {}
        |set:"xano_schema":$BEHAVIORAL_HYPOTHESES1
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $BEHAVIORAL_HYPOTHESES1
}
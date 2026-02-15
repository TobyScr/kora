function "n8n/design/generate_oasis" {
  input {
    int intervention_id?
  }

  stack {
    db.schema OASIS {
      path = ""
    } as $OASIS1
  
    api.request {
      url = "/webhook/generate_oasis"
      method = "POST"
      params = {}
        |set:"xano_schema_oasis":$OASIS1
        |!set:"xano_schema_oasis_context":$OASIS_CONTEXT1
        |!set:"xano_schema_oasis_implementation":$OASIS_IMPLEMENTATION1
        |!set:"xano_schema_oasis_objective":$OASIS_OBJECTIVE1
        |!set:"xano_schema_scoring_evaluation":$OASIS_SCORING_EVALUATION1
        |!set:"xano_schema_oasis_strategy":$OASIS_STRATEGY1
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
        |set:"xano_base_url":$env.base_url
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $api1
}
function "n8n/understand/generate_single_research_question" {
  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    // comment
  
    db.schema RESEARCH_QUESTION {
      path = ""
    } as $SCHEMA_RESEARCH_QUESTION
  
    db.query RESEARCH_QUESTION {
      where = $db.RESEARCH_QUESTION.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $RESEARCH_QUESTION
  
    api.request {
      url = "/webhook/generate_single_assumption_question"
      method = "POST"
      params = {}
        |set:"message":$SCHEMA_RESEARCH_QUESTION
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
        |set:"existing":$RESEARCH_QUESTION
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $api1
}
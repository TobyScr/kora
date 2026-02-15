// Query all RESEARCH_QUESTION records
query "projects/{intervention_id}/assumption-testing/research-question" verb=GET {
  api_group = "Assumption Testing"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query RESEARCH_QUESTION {
      where = $db.RESEARCH_QUESTION.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $model
  }

  response = $model
  tags = ["v2", "research_question"]
}
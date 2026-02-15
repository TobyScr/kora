// Add RESEARCH_QUESTION record
query "projects/{intervention_id}/assumption-testing/research-question" verb=POST {
  api_group = "Assumption Testing"

  input {
    dblink {
      table = "RESEARCH_QUESTION"
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Assumption Testing"
      }
    } as $func2
  
    db.add RESEARCH_QUESTION {
      data = {
        created_at     : "now"
        intervention_id: $input.intervention_id
        question       : $input.question
      }
    } as $model
  }

  response = $model
  tags = ["v2", "research_question"]
}
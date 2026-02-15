// Delete RESEARCH_QUESTION record
query "projects/{intervention_id}/assumption-testing/research-question/{research_question_id}" verb=DELETE {
  api_group = "Assumption Testing"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    uuid research_question_id?
  }

  stack {
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Assumption Testing"
      }
    } as $func1
  
    db.query RESEARCH_QUESTION {
      where = $db.RESEARCH_QUESTION.intervention_id == $input.intervention_id && $db.RESEARCH_QUESTION.id == $input.research_question_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Entity not found."
    }
  
    db.del RESEARCH_QUESTION {
      field_name = "id"
      field_value = $input.research_question_id
    }
  }

  response = null
  tags = ["v2", "research_question"]
}
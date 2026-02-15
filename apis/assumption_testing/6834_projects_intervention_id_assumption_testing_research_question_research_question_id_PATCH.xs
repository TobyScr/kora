// Edit RESEARCH_QUESTION record
query "projects/{intervention_id}/assumption-testing/research-question/{research_question_id}" verb=PATCH {
  api_group = "Assumption Testing"
  auth = "USER"

  input {
    uuid research_question_id?
    dblink {
      table = "RESEARCH_QUESTION"
    }
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
  
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch RESEARCH_QUESTION {
      field_name = "id"
      field_value = $input.research_question_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
  tags = ["v2", "research_question"]
}
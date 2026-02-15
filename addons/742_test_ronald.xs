addon test_ronald {
  input {
    int hypothesis_id?
  }

  stack {
    db.query "" {
      where = $db.BEHAVIORAL_RESEARCH_QUESTIONS.behavioral_hypotheses_id in $input.hypothesis_id
      sort = {BEHAVIORAL_RESEARCH_QUESTIONS.id: "asc"}
      return = {type: "list"}
    }
  }
}
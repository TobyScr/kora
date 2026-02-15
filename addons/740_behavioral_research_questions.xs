addon BEHAVIORAL_RESEARCH_QUESTIONS {
  input {
    int BEHAVIORAL_RESEARCH_QUESTIONS_id? {
      table = ""
    }
  }

  stack {
    db.query "" {
      where = $db.BEHAVIORAL_RESEARCH_QUESTIONS.id == $input.BEHAVIORAL_RESEARCH_QUESTIONS_id
      return = {type: "list"}
    }
  }
}
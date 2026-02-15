addon OS_PROBLEM_INFLUENCES {
  input {
    int OS_PROBLEM_INFLUENCES_id? {
      table = ""
    }
  }

  stack {
    db.query "" {
      where = $db.OS_PROBLEM_INFLUENCES.id == $input.OS_PROBLEM_INFLUENCES_id
      return = {type: "single"}
    }
  }
}
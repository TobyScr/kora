addon OS_JOURNEY_PHASE {
  input {
    int OS_JOURNEY_PHASE_id? {
      table = "OS_JOURNEY_PHASE"
    }
  }

  stack {
    db.query OS_JOURNEY_PHASE {
      where = $db.OS_JOURNEY_PHASE.id == $input.OS_JOURNEY_PHASE_id
      return = {type: "single"}
    }
  }
}
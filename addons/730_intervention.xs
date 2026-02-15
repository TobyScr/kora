addon intervention {
  input {
    int INTERVENTION_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query INTERVENTION {
      where = $db.INTERVENTION.id == $input.INTERVENTION_id
      return = {type: "single"}
    }
  }
}
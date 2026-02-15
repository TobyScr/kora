query "testing-interventions" verb=GET {
  api_group = "Brief"

  input {
  }

  stack {
    db.query INTERVENTION {
      where = $db.INTERVENTION.current_step == 6
      return = {type: "list"}
    } as $INTERVENTION1
  
    db.query BRIEF_OUTPUT {
      where = $db.BRIEF_OUTPUT.intervention_id in $INTERVENTION1.id
      return = {type: "list"}
    } as $BRIEF_OUTPUT1
  }

  response = $BRIEF_OUTPUT1
}
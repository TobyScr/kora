// Query all behavioural_objective records
query "intervention-info/{intervention_id}/behavioural_objective" verb=GET {
  api_group = "n8n"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query BEHAVIOURAL_OBJECTIVE_NEW {
      where = $db.BEHAVIOURAL_OBJECTIVE_NEW.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $behavioural_objective
  }

  response = $behavioural_objective
}
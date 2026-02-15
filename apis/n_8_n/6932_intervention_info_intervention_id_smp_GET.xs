query "intervention-info/{intervention_id}/smp" verb=GET {
  api_group = "n8n"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query SM_PROPOSITION {
      where = $db.SM_PROPOSITION.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $smp
  }

  response = $smp
}
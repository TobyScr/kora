query "intervention-info/{intervention_id}/cta" verb=GET {
  api_group = "n8n"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query CTA {
      where = $db.CTA.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $cta
  }

  response = $cta
}
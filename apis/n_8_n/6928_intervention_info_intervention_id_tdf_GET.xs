// Query all TFD_CARD records
query "intervention-info/{intervention_id}/tdf" verb=GET {
  api_group = "n8n"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query TFD_CARD {
      where = $db.TFD_CARD.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $tdf
  }

  response = $tdf
}
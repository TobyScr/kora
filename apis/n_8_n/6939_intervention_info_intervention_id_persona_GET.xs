// Query all PERSONA records
query "intervention-info/{intervention_id}/persona" verb=GET {
  api_group = "n8n"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query PERSONA {
      where = $db.PERSONA.intervention_id == $input.intervention_id
      return = {type: "list"}
      addon = [
        {
          name : "DEMOGRAPHICS"
          input: {DEMOGRAPHICS_id: $output.demographics_id}
          as   : "_demographics"
        }
        {
          name : "PSYCHOGRAPHICS"
          input: {PSYCHOGRAPHICS_id: $output.psychographics_id}
          as   : "_psychographics"
        }
        {
          name : "CONTEXT_MEDIA"
          input: {CONTEXT_MEDIA_id: $output.context_media_id}
          as   : "_context_media"
        }
      ]
    } as $PERSONA1
  }

  response = $PERSONA1
}
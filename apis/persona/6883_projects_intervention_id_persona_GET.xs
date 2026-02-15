// Query all PERSONA records
query "projects/{intervention_id}/persona" verb=GET {
  api_group = "Persona"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query PERSONA {
      where = $db.PERSONA.intervention_id == $input.intervention_id
      return = {type: "list"}
      output = ["id", "created_at", "intervention_id"]
      addon = [
        {
          name  : "CONTEXT_MEDIA"
          output: [
            "social_influencer_network"
            "media_consumption_habits"
            "language_symbols"
          ]
          input : {CONTEXT_MEDIA_id: $output.context_media_id}
        }
        {
          name  : "DEMOGRAPHICS"
          output: [
            "location"
            "language"
            "children"
            "employment"
            "education"
            "name"
            "age"
            "gender"
            "marital_status"
            "quote"
            "file.access"
            "file.path"
            "file.name"
            "file.type"
            "file.size"
            "file.mime"
            "file.meta"
            "file.url"
          ]
          input : {DEMOGRAPHICS_id: $output.demographics_id}
        }
        {
          name  : "PSYCHOGRAPHICS"
          output: ["values", "aspirations", "life_goals", "concerns_challenges"]
          input : {PSYCHOGRAPHICS_id: $output.psychographics_id}
        }
      ]
    } as $model
  }

  response = $model
  tags = ["persona", "v2"]
}
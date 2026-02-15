function "n8n/Intervention Info/Get confirmed Personas" {
  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    json intervention_info
    text[] confirmed_steps
  }

  stack {
    var $info {
      value = $input.intervention_info
    }
  
    conditional {
      if ($input.confirmed_steps|in:"Personas") {
        db.query PERSONA {
          where = $db.PERSONA.intervention_id == $input.intervention_id
          return = {type: "list"}
          output = ["id"]
          addon = [
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
                "file.url"
              ]
              input : {DEMOGRAPHICS_id: $output.demographics_id}
              as    : "demographics"
            }
            {
              name  : "PSYCHOGRAPHICS"
              output: ["values", "aspirations", "life_goals", "concerns_challenges"]
              input : {PSYCHOGRAPHICS_id: $output.psychographics_id}
              as    : "psychographics"
            }
            {
              name  : "CONTEXT_MEDIA"
              output: [
                "social_influencer_network"
                "media_consumption_habits"
                "language_symbols"
              ]
              input : {CONTEXT_MEDIA_id: $output.context_media_id}
              as    : "context_media"
            }
          ]
        } as $PERSONAS
      
        var.update $info {
          value = $info
            |set:"PERSONAS":($PERSONAS|unset:"created_at")
        }
      }
    }
  }

  response = $info
}
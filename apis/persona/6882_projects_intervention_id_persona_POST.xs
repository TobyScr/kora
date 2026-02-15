// Add PERSONA record
query "projects/{intervention_id}/persona" verb=POST {
  api_group = "Persona"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    dblink {
      table = "CONTEXT_MEDIA"
      override = {intervention_id: {hidden: true}}
    }
  
    dblink {
      table = "DEMOGRAPHICS"
      override = {file: {hidden: true}, intervention_id: {hidden: true}}
    }
  
    dblink {
      table = "PSYCHOGRAPHICS"
      override = {intervention_id: {hidden: true}}
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  
    db.query PERSONA {
      where = $db.PERSONA.intervention_id == $input.intervention_id
      return = {type: "count"}
    } as $EXISTS
  
    precondition ($EXISTS < 3) {
      error = "No more personas can be created for this intervention."
    }
  
    db.transaction {
      stack {
        db.add DEMOGRAPHICS {
          data = {
            intervention_id: $input.intervention_id
            location       : $input.location
            language       : $input.language
            children       : $input.children
            employment     : $input.employment
            education      : $input.education
            name           : $input.name
            age            : $input.age
            gender         : $input.gender
            marital_status : $input.marital_status
            quote          : $input.quote
          }
        } as $DEMOGRAPHICS
      
        db.add PSYCHOGRAPHICS {
          data = {
            intervention_id    : $input.intervention_id
            values             : $input.values
            aspirations        : $input.aspirations
            life_goals         : $input.life_goals
            concerns_challenges: $input.concerns_challenges
          }
        } as $PSYCHOGRAPHICS
      
        db.add CONTEXT_MEDIA {
          data = {
            intervention_id          : $input.intervention_id
            social_influencer_network: $input.social_influencer_network
            media_consumption_habits : $input.media_consumption_habits
            language_symbols         : $input.language_symbols
          }
        } as $CONTEXT_MEDIA
      
        db.add PERSONA {
          data = {
            created_at       : "now"
            intervention_id  : $input.intervention_id
            demographics_id  : $DEMOGRAPHICS.id
            psychographics_id: $PSYCHOGRAPHICS.id
            context_media_id : $CONTEXT_MEDIA.id
          }
        } as $model
      }
    }
  }

  response = $model
  tags = ["persona", "v2"]
}
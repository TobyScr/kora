query new_ta_persona verb=POST {
  api_group = "n8n"

  input {
    dblink {
      table = "DEMOGRAPHICS"
    }
  
    dblink {
      table = "PSYCHOGRAPHICS"
    }
  
    dblink {
      table = "CONTEXT_MEDIA"
    }
  }

  stack {
    db.add DEMOGRAPHICS {
      data = {
        intervention_id: $input.intervention_id
        name           : $input.name
        age            : $input.age
        gender         : $input.gender
        language       : $input.language
        location       : $input.location
        marital_status : $input.marital_status
        children       : $input.children
        education      : $input.education
        employment     : $input.employment
        created_at     : now
      }
    } as $DEMOGRAPHICS1
  
    db.add PSYCHOGRAPHICS {
      data = {
        intervention_id               : $input.intervention_id
        beliefs                       : $input.beliefs
        values                        : $input.values
        aspirations                   : $input.aspirations
        emotional_motivators          : $input.emotional_motivators
        attitudes                     : $input.attitudes
        worldview                     : $input.worldview
        perceived_threats_frustrations: $input.perceived_threats_frustrations
        norm_perceptions              : $input.norm_perceptions
        trusted_messengers_sources    : $input.trusted_messengers_sources
        identity_anchors              : $input.identity_anchors
        created_at                    : now
      }
    } as $PSYCHOGRAPHICS1
  
    db.add CONTEXT_MEDIA {
      data = {
        intervention_id                : $input.intervention_id
        social_influencer_network      : $input.social_influencer_network
        information_influence_ecosystem: $input.information_influence_ecosystem
        triggers                       : $input.triggers
        emotional_triggers             : $input.emotional_triggers
        change_receptivity             : $input.change_receptivity
        language_symbols_used          : $input.language_symbols_used
        created_at                     : now
      }
    } as $CONTEXT_BEHAVIORS1
  }

  response = "TA Persona Created"
}
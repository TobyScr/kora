function "n8n/Intervention Info/Get Persona For Img Gen" {
  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    var $info {
      value = ""|set:"PERSONA":[]
    }
  
    db.get CONTEXT_MEDIA {
      field_name = "intervention_id"
      field_value = $input.intervention_id
      output = [
        "id"
        "social_influencer_network"
        "information_influence_ecosystem"
        "triggers"
        "emotional_triggers"
        "change_receptivity"
        "language_symbols_used"
      ]
    } as $CONTEXT_BEHAVIORS
  
    var.update $info.PERSONA {
      value = ""
        |set:"CONTEXT_BEHAVIORS":$CONTEXT_BEHAVIORS
    }
  
    db.get DEMOGRAPHICS {
      field_name = "intervention_id"
      field_value = $input.intervention_id
      output = [
        "id"
        "name"
        "age"
        "gender"
        "language"
        "location"
        "marital_status"
        "children"
        "education"
        "employment"
      ]
    } as $DEMOGRAPHICS
  
    var.update $info.PERSONA {
      value = $info.PERSONA|set:"DEMOGRAPHICS":$DEMOGRAPHICS
    }
  
    db.get PSYCHOGRAPHICS {
      field_name = "intervention_id"
      field_value = $input.intervention_id
      output = [
        "id"
        "beliefs"
        "values"
        "emotional_motivators"
        "attitudes"
        "worldview"
        "perceived_threats_frustrations"
        "norm_perceptions"
        "trusted_messengers_sources"
        "identity_anchors"
      ]
    } as $PSYCHOGRAPHICS
  
    var.update $info.PERSONA {
      value = $info.PERSONA
        |set:"PSYCHOGRAPHICS":$PSYCHOGRAPHICS
    }
  }

  response = $info
  tags = ["deprecated"]
}
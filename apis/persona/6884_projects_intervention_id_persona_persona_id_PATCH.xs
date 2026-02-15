// Edit PERSONA record,the related tables will be automatically updated 
query "projects/{intervention_id}/persona/{persona_id}" verb=PATCH {
  api_group = "Persona"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    dblink {
      table = "DEMOGRAPHICS"
      override = {file: {hidden: true}, intervention_id: {hidden: true}}
    }
  
    dblink {
      table = "PSYCHOGRAPHICS"
      override = {intervention_id: {hidden: true}}
    }
  
    dblink {
      table = "CONTEXT_MEDIA"
      override = {intervention_id: {hidden: true}}
    }
  
    uuid persona_id {
      table = "PERSONA"
    }
  }

  stack {
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Personas"
      }
    } as $func1
  
    db.query PERSONA {
      where = $db.PERSONA.intervention_id == $input.intervention_id && $db.PERSONA.id == $input.persona_id
      return = {type: "single"}
    } as $PERSONA
  
    precondition ($PERSONA != null) {
      error_type = "notfound"
      error = "Persona not found."
    }
  
    db.schema DEMOGRAPHICS {
      path = ""
    } as $DEMOGRAPHICS_FIELDS|get:"name":[]|remove:"intervention_id":"":false
  
    db.schema PSYCHOGRAPHICS {
      path = ""
    } as $PSYCHOGRAPHICS_FIELDS|get:"name":[]|remove:"intervention_id":"":false
  
    db.schema CONTEXT_MEDIA {
      path = ""
    } as $CONTEXT_MEDIA_FILEDS|get:"name":[]|remove:"intervention_id":"":false
  
    var $update_fields {
      value = {}
        |set:"DEMOGRAPHICS":($input
          |pick:($DEMOGRAPHICS_FIELDS)
          |filter_null
          |filter_empty_text
        )
        |set:"PSYCHOGRAPHICS":($input
          |pick:($PSYCHOGRAPHICS_FIELDS)
          |filter_null
          |filter_empty_text
        )
        |set:"CONTEXT_MEDIA":($input
          |pick:($CONTEXT_MEDIA_FILEDS)
          |filter_null
          |filter_empty_text
        )
    }
  
    db.transaction {
      stack {
        conditional {
          if (($update_fields.DEMOGRAPHICS|is_empty) == false) {
            db.patch DEMOGRAPHICS {
              field_name = "id"
              field_value = $PERSONA.demographics_id
              data = $update_fields.DEMOGRAPHICS
              output = [
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
              ]
            }
          }
        }
      
        conditional {
          if (($update_fields.PSYCHOGRAPHICS|is_empty) == false) {
            db.patch PSYCHOGRAPHICS {
              field_name = "id"
              field_value = $PERSONA.psychographics_id
              data = $update_fields.PSYCHOGRAPHICS
              output = ["values", "aspirations", "life_goals", "concerns_challenges"]
            }
          }
        }
      
        conditional {
          if (($update_fields.CONTEXT_MEDIA|is_empty) == false) {
            db.patch CONTEXT_MEDIA {
              field_name = "id"
              field_value = $PERSONA.context_media_id
              data = $update_fields.CONTEXT_MEDIA
            }
          }
        }
      }
    }
  
    db.query PERSONA {
      where = $db.PERSONA.intervention_id == $input.intervention_id && $db.PERSONA.id == $input.persona_id
      return = {type: "single"}
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
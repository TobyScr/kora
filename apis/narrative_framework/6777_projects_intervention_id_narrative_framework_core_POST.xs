// Add or update the CORE_NARRATIVE records
query "projects/{intervention_id}/narrative-framework/core" verb=POST {
  api_group = "Narrative Framework"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    text beginning filters=trim
    text tension filters=trim
    text resolution filters=trim
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    }
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Narrative Framework"
      }
    } as $func2
  
    precondition (($input.beginning|is_empty) == false && ($input.tension|is_empty) == false && ($input.resolution|is_empty) == false) {
      error_type = "inputerror"
      error = "Core narrative can't be empty."
    }
  
    db.transaction {
      stack {
        db.query CORE_NARRATIVE {
          where = $db.CORE_NARRATIVE.intervention_id == $input.intervention_id && $db.CORE_NARRATIVE.title == "Beginning"
          return = {type: "single"}
          output = ["id"]
        } as $BEGINNING
      
        conditional {
          if ($BEGINNING|is_empty) {
            db.add CORE_NARRATIVE {
              data = {
                intervention_id: $input.intervention_id
                created_at     : "now"
                title          : "Beginning"
                narrative      : $input.beginning
              }
            }
          }
        
          else {
            db.edit CORE_NARRATIVE {
              field_name = "id"
              field_value = $BEGINNING.id
              data = {narrative: $input.beginning}
            }
          }
        }
      
        db.query CORE_NARRATIVE {
          where = $db.CORE_NARRATIVE.intervention_id == $input.intervention_id && $db.CORE_NARRATIVE.title == "Tension"
          return = {type: "single"}
          output = ["id"]
        } as $TENSION
      
        conditional {
          if ($TENSION|is_empty) {
            db.add CORE_NARRATIVE {
              data = {
                intervention_id: $input.intervention_id
                created_at     : "now"
                title          : "Tension"
                narrative      : $input.tension
              }
            }
          }
        
          else {
            db.edit CORE_NARRATIVE {
              field_name = "id"
              field_value = $TENSION.id
              data = {narrative: $input.tension}
            }
          }
        }
      
        db.query CORE_NARRATIVE {
          where = $db.CORE_NARRATIVE.intervention_id == $input.intervention_id && $db.CORE_NARRATIVE.title == "Resolution"
          return = {type: "single"}
          output = ["id"]
        } as $RESOLUTION
      
        conditional {
          if ($RESOLUTION|is_empty) {
            db.add CORE_NARRATIVE {
              data = {
                intervention_id: $input.intervention_id
                created_at     : "now"
                title          : "Resolution"
                narrative      : $input.resolution
              }
            }
          }
        
          else {
            db.edit CORE_NARRATIVE {
              field_name = "id"
              field_value = $RESOLUTION.id
              data = {narrative: $input.resolution}
            }
          }
        }
      
        db.query CORE_NARRATIVE {
          where = $db.CORE_NARRATIVE.intervention_id == $input.intervention_id
          return = {type: "list"}
          output = ["title", "narrative"]
        } as $model
      }
    }
  }

  response = $model
  tags = ["v2", "narrative_framework", "core_narrative"]
}
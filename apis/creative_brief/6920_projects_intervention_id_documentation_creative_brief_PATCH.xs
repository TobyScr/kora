// Given the fields, edit the respective records for the Creative Brief section
query "projects/{intervention_id}/documentation/creative-brief" verb=PATCH {
  api_group = "Creative Brief"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    dblink {
      table = "CBD_AUDIENCE"
      override = {
        created_at     : {hidden: true}
        intervention_id: {hidden: true}
      }
    }
  
    dblink {
      table = "CBD_BRIEF"
      override = {
        created_at     : {hidden: true}
        intervention_id: {hidden: true}
      }
    }
  
    dblink {
      table = "CBD_INTRODUCTION"
      override = {
        created_at     : {hidden: true}
        intervention_id: {hidden: true}
      }
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    }
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Creative Brief"
      }
    }
  
    db.query CBD_INTRODUCTION {
      where = $db.CBD_INTRODUCTION.intervention_id == $input.intervention_id
      return = {type: "single"}
      output = ["id"]
    } as $CBD_INTRODUCTION
  
    db.query CBD_AUDIENCE {
      where = $db.CBD_AUDIENCE.intervention_id == $input.intervention_id
      return = {type: "single"}
      output = ["id"]
    } as $CBD_AUDIENCE
  
    db.query CBD_BRIEF {
      where = $db.CBD_BRIEF.intervention_id == $input.intervention_id
      return = {type: "single"}
      output = ["id"]
    } as $CBD_BRIEF
  
    precondition ($CBD_INTRODUCTION != null && $CBD_AUDIENCE != null && $CBD_BRIEF != null) {
      error_type = "notfound"
      error = "Entity not found."
    }
  
    db.schema CBD_INTRODUCTION {
      path = ""
    } as $INTRODUCTION_FIELDS|get:"name":[]|remove:"intervention_id":"":false
  
    db.schema CBD_AUDIENCE {
      path = ""
    } as $AUDIENCE_FIELDS|get:"name":[]|remove:"intervention_id":"":false
  
    db.schema CBD_BRIEF {
      path = ""
    } as $BRIEF_FIELDS|get:"name":[]|remove:"intervention_id":"":false
  
    var $update_fields {
      value = {}
        |set:"INTRODUCTION":($input
          |pick:($INTRODUCTION_FIELDS)
          |filter_null
          |filter_empty_text
        )
        |set:"AUDIENCE":($input
          |pick:($AUDIENCE_FIELDS)
          |filter_null
          |filter_empty_text
        )
        |set:"BRIEF":($input
          |pick:($BRIEF_FIELDS)
          |filter_null
          |filter_empty_text
        )
    }
  
    db.transaction {
      stack {
        conditional {
          if (($update_fields.INTRODUCTION|is_empty) == false) {
            db.patch CBD_INTRODUCTION {
              field_name = "id"
              field_value = $CBD_INTRODUCTION.id
              data = $update_fields.INTRODUCTION
            } as $CBD_INTRODUCTION
          }
        }
      
        conditional {
          if (($update_fields.AUDIENCE|is_empty) == false) {
            db.patch CBD_AUDIENCE {
              field_name = "id"
              field_value = $CBD_AUDIENCE.id
              data = $update_fields.AUDIENCE
            } as $CBD_AUDIENCE
          }
        }
      
        conditional {
          if (($update_fields.BRIEF|is_empty) == false) {
            db.patch CBD_BRIEF {
              field_name = "id"
              field_value = $CBD_BRIEF.id
              data = $update_fields.BRIEF
            } as $CBD_BRIEF
          }
        }
      }
    }
  }

  response = {
    INTRODUCTION: $CBD_INTRODUCTION
    AUDIENCE    : $CBD_AUDIENCE
    BRIEF       : $CBD_BRIEF
  }

  tags = ["v2", "creative_brief"]
}
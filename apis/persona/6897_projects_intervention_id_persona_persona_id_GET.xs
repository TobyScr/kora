// Get DEMOGRAPHIC record by PERSONA
query "projects/{intervention_id}/persona/{persona_id}" verb=GET {
  api_group = "Persona"

  input {
    uuid persona_id?
  }

  stack {
    db.get PERSONA {
      field_name = "id"
      field_value = $input.persona_id
    } as $model
  
    precondition ($model != null) {
      error_type = "notfound"
      error = "Not Found"
    }
  
    var $demographic_id {
      value = $model.demographics_id
    }
  
    db.query DEMOGRAPHICS {
      where = $db.DEMOGRAPHICS.id == $demographic_id
      return = {type: "list"}
    } as $demographics
  }

  response = $demographics
}
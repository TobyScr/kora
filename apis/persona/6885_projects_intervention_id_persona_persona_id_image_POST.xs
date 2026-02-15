// Upload image for specific persona
query "projects/{intervention_id}/persona/{persona_id}/image" verb=POST {
  api_group = "Persona"

  input {
    file content?
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    uuid persona_id {
      table = "PERSONA"
    }
  }

  stack {
    !function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Personas"
      }
    } as $func1
  
    db.query PERSONA {
      where = $db.PERSONA.id == $input.persona_id
      return = {type: "single"}
    } as $PERSONA
  
    precondition ($PERSONA != null) {
      error_type = "notfound"
      error = "Persona not found."
    }
  
    storage.create_image {
      value = $input.content
      access = "public"
    } as $image
  
    db.edit DEMOGRAPHICS {
      field_name = "id"
      field_value = $PERSONA.demographics_id
      data = {file: $image}
    } as $DEMOGRAPHICS1
  }

  response = null
  tags = ["persona", "v2"]
}
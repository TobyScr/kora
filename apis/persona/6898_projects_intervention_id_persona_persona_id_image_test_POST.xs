// Upload image for specific persona
query "projects/{intervention_id}/persona/{persona_id}/image_test" verb=POST {
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
  
    storage.create_image {
      value = $input.content
      access = "public"
    } as $image
  }

  response = $file1
  tags = ["persona", "v2"]
}
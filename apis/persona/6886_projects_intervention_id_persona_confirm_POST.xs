// confirm the Persona section
query "projects/{intervention_id}/persona/confirm" verb=POST {
  api_group = "Persona"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.transaction {
      stack {
        function.run "Utils/confirm_intervention_step" {
          input = {
            intervention_id: $input.intervention_id
            current_step   : "Personas"
            next_step      : "COM-B & Personas"
          }
        }
      
        function.run "Utils/confirm_intervention_step" {
          input = {
            intervention_id: $input.intervention_id
            current_step   : "COM-B & Personas"
            next_step      : "Understand"
          }
        }
      
        function.run "Utils/confirm_intervention_step" {
          input = {
            intervention_id: $input.intervention_id
            current_step   : "Understand"
            next_step      : "Think-Feel-Do"
          }
        }
      }
    }
  }

  response = null
  tags = ["persona", "v2"]
}
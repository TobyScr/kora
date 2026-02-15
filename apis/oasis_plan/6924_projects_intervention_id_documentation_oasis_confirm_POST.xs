// Confirm the OASIS Plan section
query "projects/{intervention_id}/documentation/oasis/confirm" verb=POST {
  api_group = "OASIS Plan"
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
            current_step   : "OASIS Plan"
            next_step      : "Documentation"
          }
        }
      
        function.run "Utils/confirm_intervention_step" {
          input = {
            intervention_id: $input.intervention_id
            current_step   : "Documentation"
            next_step      : "Design"
          }
        }
      
        function.run "Utils/confirm_intervention_step" {
          input = {
            intervention_id: $input.intervention_id
            current_step   : "Design"
            next_step      : "Activate Temp"
          }
        }
      }
    }
  }

  response = null
  tags = ["v2", "oasis"]
}
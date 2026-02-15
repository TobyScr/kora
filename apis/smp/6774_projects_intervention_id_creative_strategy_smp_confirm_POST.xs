// Confirm then Single-Minded Proposition section
query "projects/{intervention_id}/creative-strategy/smp/confirm" verb=POST {
  api_group = "SMP"
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
            current_step   : "Single-Minded Proposition"
            next_step      : "Creative Strategy"
          }
        }
      
        function.run "Utils/confirm_intervention_step" {
          input = {
            intervention_id: $input.intervention_id
            current_step   : "Creative Strategy"
            next_step      : "Narrative Framework"
          }
        }
      }
    }
  }

  response = null
  tags = ["v2", "smp"]
}
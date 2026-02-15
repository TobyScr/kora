// Confirm the Journey Map section
query "projects/{intervention_id}/campaign-journey/jm/confirm" verb=POST {
  api_group = "Journey Map"
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
            current_step   : "Journey Map"
            next_step      : "Campaign Journey"
          }
        }
      
        function.run "Utils/confirm_intervention_step" {
          input = {
            intervention_id: $input.intervention_id
            current_step   : "Campaign Journey"
            next_step      : "MREL Indicators"
          }
        }
      }
    }
  }

  response = null
  tags = ["v2", "journey_map"]
}
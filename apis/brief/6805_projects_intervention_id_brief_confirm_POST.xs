// Confirm the BRIEF section
query "projects/{intervention_id}/brief/confirm" verb=POST {
  api_group = "Brief"
  auth = "USER"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    db.transaction {
      stack {
        function.run "Utils/confirm_intervention_step" {
          input = {
            intervention_id: $input.intervention_id
            current_step   : "Brief Overview"
            next_step      : "Research Insights"
          }
        }
      
        db.edit BRIEF_OUTPUT {
          field_name = "intervention_id"
          field_value = $input.intervention_id
          data = {is_confirmed: true}
        } as $BRIEF_OUTPUT1
      }
    }
  }

  response = null
  tags = ["brief", "v2"]
}
// Confirm the Get-Who-To-By section
query "projects/{intervention_id}/behavioral-framing/gwtb/confirm" verb=POST {
  api_group = "GWTB"
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
            current_step   : "Get-Who-To-By"
            next_step      : "Behavioral Framing"
          }
        } as $func1
      
        function.run "Utils/confirm_intervention_step" {
          input = {
            intervention_id: $input.intervention_id
            current_step   : "Behavioral Framing"
            next_step      : "Approach"
          }
        } as $func1
      }
    }
  }

  response = null
  tags = ["v2", "get_who_to_by"]
}
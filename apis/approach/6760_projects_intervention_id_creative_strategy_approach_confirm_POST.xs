// Confirm the Approach section and move to the respective step
query "projects/{intervention_id}/creative-strategy/approach/confirm" verb=POST {
  api_group = "Approach"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.get APPROACH {
      field_name = "intervention_id"
      field_value = $input.intervention_id
      addon = [
        {
          name  : "OS_CREATIVE_APPROACH_OPTION"
          output: ["type"]
          input : {
            OS_CREATIVE_APPROACH_OPTIONS_id: $output.selected_option_id
          }
        }
      ]
    } as $CREATIVE_APPROACH
  
    precondition ($CREATIVE_APPROACH != null) {
      error_type = "badrequest"
      error = "Option has not been selected"
    }
  
    db.transaction {
      stack {
        conditional {
          if ($CREATIVE_APPROACH.type == "Develop Creative Strategy") {
            function.run "Utils/confirm_intervention_step" {
              input = {
                intervention_id: $input.intervention_id
                current_step   : "Approach"
                next_step      : "Territory"
              }
            }
          }
        
          else {
            function.run "Utils/confirm_intervention_step" {
              input = {
                intervention_id: $input.intervention_id
                current_step   : "Approach"
                next_step      : "Territory"
              }
            }
          
            function.run "Utils/confirm_intervention_step" {
              input = {
                intervention_id: $input.intervention_id
                current_step   : "Territory"
                next_step      : "Single-Minded Proposition"
              }
            }
          
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
    }
  }

  response = null
  tags = ["v2", "approach"]
}
// Validate the current intervention step
// Add the confirmation log to the STEP_CONFIRMATION_LOG table
// Change the current intervention step to the next step indicated
function "Utils/confirm_intervention_step" {
  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    text current_step filters=trim
    text next_step filters=trim
  }

  stack {
    db.get INTERVENTION {
      field_name = "id"
      field_value = $input.intervention_id
    } as $INTERVENTION
  
    db.get WORKFLOW_STEP {
      field_name = "name"
      field_value = $input.next_step
      output = ["id", "helper_text_id"]
    } as $NEXT_STEP
  
    db.get WORKFLOW_STEP {
      field_name = "name"
      field_value = $input.current_step
      output = ["id"]
    } as $CURRENT_STEP
  
    // Check that all related entities exists
  
    precondition ($INTERVENTION != null && $NEXT_STEP != null && $CURRENT_STEP != null) {
      error_type = "notfound"
      error = "Step information not found."
    }
  
    conditional {
      if ($INTERVENTION.current_step == $CURRENT_STEP.id) {
        db.transaction {
          stack {
            conditional {
              if ($NEXT_STEP.helper_text_id == null) {
                db.edit INTERVENTION {
                  field_name = "id"
                  field_value = $INTERVENTION.id
                  data = {current_step: $NEXT_STEP.id}
                }
              }
            
              else {
                db.edit INTERVENTION {
                  field_name = "id"
                  field_value = $INTERVENTION.id
                  data = {
                    current_step: $NEXT_STEP.id
                    helper_text : $NEXT_STEP.helper_text_id
                  }
                }
              }
            }
          
            db.add STEP_CONFIRMATION_LOG {
              data = {
                confirmed_at   : "now"
                intervention_id: $input.intervention_id
                step_id        : $CURRENT_STEP.id
                user_id        : $auth.id
              }
            } as $LOG
          }
        }
      
        function.run "n8n/ai_generation_router" {
          input = {
            intervention_id: $input.intervention_id
            confirmed_step : $CURRENT_STEP.id
            step_log_id    : $LOG.id
          }
        } as $result
      
        function.run "Utils/Update Intervention progress percentage" {
          input = {intervention_id: $input.intervention_id}
        }
      }
    
      else {
        precondition ($INTERVENTION.current_step == $CURRENT_STEP.id) {
          error_type = "badrequest"
          error = `"Current intervention step doesnt match \""|concat:$input.current_step:|concat:"\"":`
        }
      }
    }
  }

  response = null
}
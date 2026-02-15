// Check the STEP_CONFIRMATION_LOG to determine if edition is allowed
function "Utils/Can be edited or is it Confirmed" {
  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    text step filters=trim
  }

  stack {
    db.get WORKFLOW_STEP {
      field_name = "name"
      field_value = $input.step
      output = ["id"]
    } as $WORKFLOW_STEP|get:"id":null
  
    precondition ($WORKFLOW_STEP != null) {
      error_type = "notfound"
      error = "Step not found."
    }
  
    db.query STEP_CONFIRMATION_LOG {
      where = $db.STEP_CONFIRMATION_LOG.intervention_id == $input.intervention_id && $db.STEP_CONFIRMATION_LOG.step_id == $WORKFLOW_STEP
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS == false) {
      error_type = "unauthorized"
      error = "Intervention step confirmed, edition not allowed"
    }
  }

  response = null
}
query "intervention/{intervention_id}" verb=GET {
  api_group = "Intervention"
  auth = "USER"

  input {
    int intervention_id? filters=min:1
  }

  stack {
    db.get INTERVENTION {
      field_name = "id"
      field_value = $input.intervention_id
      addon = [
        {
          name  : "WORKFLOW_STEP"
          output: ["id2"]
          input : {WORKFLOW_STEP_id: $output.current_step}
          as    : "_workflow_step"
        }
      ]
    } as $model
  
    precondition ($model != null) {
      error_type = "notfound"
      error = "Not Found"
    }
  }

  response = $model
}
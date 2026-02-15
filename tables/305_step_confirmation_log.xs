table STEP_CONFIRMATION_LOG {
  auth = false

  schema {
    int id
    timestamp confirmed_at?=now
    int intervention_id {
      table = "INTERVENTION"
    }
  
    int step_id {
      table = "WORKFLOW_STEP"
    }
  
    int user_id? {
      table = "USER"
    }
  }

  index = [{type: "primary", field: [{name: "id"}]}]
  tags = ["active"]
}
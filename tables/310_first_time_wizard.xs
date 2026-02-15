// this table holds every step of first time wizards and their related workflow steps.
table FIRST_TIME_WIZARD {
  auth = false

  schema {
    int id
    text tip_name? filters=trim
    int workflow_step_id? {
      table = "WORKFLOW_STEP"
    }
  
    int order?
  }

  index = [{type: "primary", field: [{name: "id"}]}]
  tags = ["active"]
}
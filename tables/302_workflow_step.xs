table WORKFLOW_STEP {
  auth = false

  schema {
    int id
    text name filters=trim
    int? parent_id? {
      table = "WORKFLOW_STEP"
    }
  
    int group
    int? order?
    text ai_slug? filters=trim
    int triggers? {
      table = "WORKFLOW_STEP"
    }
  
    // Helper Text to show when this step becomes the current step
    int? helper_text_id? {
      table = "OS_HELPER_TEXT"
    }
  }

  index = [{type: "primary", field: [{name: "id"}]}]
  tags = ["active"]
}
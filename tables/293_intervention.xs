// This table stores all project interventions
table INTERVENTION {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    text name? filters=trim
    int current_step? {
      table = "WORKFLOW_STEP"
    }
  
    text description? filters=trim
  
    // This is a reference to PROJECT table
    int project_id {
      table = "PROJECT"
    }
  
    bool is_deleted?
    bool is_duplicated?
    timestamp? last_modified?
  
    // unique id of the chat
    text chat_id? filters=trim
  
    int helper_text? {
      table = "OS_HELPER_TEXT"
    }
  
    int percentage?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["intervention", "active"]
}
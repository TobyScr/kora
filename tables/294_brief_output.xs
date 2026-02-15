table BRIEF_OUTPUT {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    text client? filters=trim
    text location? filters=trim|min:1
    enum budget_currency? {
      values = ["￡", "€", "$", "£"]
    }
  
    int budget_min?
    int budget_max?
    enum timeline_unit? {
      values = ["Days", "Weeks", "Months", "Years"]
    }
  
    int timeline_min?
    int timeline_max?
    text problem_definition? filters=trim
    text high_level_objective? filters=trim
    bool is_confirmed?
    int section_stage_id?
    text expected_deliverables? filters=trim
  
    // This column will store a list of texts for ta_profile.
    text[] ta_profile? filters=trim
  
    // This column will store a list of texts for do's.
    text[] dos? filters=trim
  
    // This column will store a list of texts for don'ts.
    text[] donts? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["active", "brief", "v2"]
}
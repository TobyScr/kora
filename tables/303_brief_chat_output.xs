// Stores detailed content for a brief, linked exclusively to an intervention.
table BRIEF_CHAT_OUTPUT {
  auth = false

  schema {
    int id
    timestamp created_at?=now
  
    // Links to the associated intervention.
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    // The client or funding organization for the brief.
    text client_funder? filters=trim
  
    // The primary challenge addressed by the brief.
    text core_challenge? filters=trim
  
    // The initial objective for the brief.
    text initial_objective? filters=trim
  
    // Detailed description of the initial target audience.
    text initial_target_audience? filters=trim
  
    // Geographical focus for the brief.
    text location? filters=trim
  
    // A list of 'do' guidelines for the brief.
    text[] dos? filters=trim
  
    // A list of 'don't' guidelines for the brief.
    text[] donts? filters=trim
  
    // The allocated budget amount for the brief.
    decimal budget_amount?
  
    // The currency of the allocated budget (e.g., 'USD').
    text budget_currency? filters=trim
  
    // The target completion date for the brief.
    date timeline_end_date?
  
    text expected_outputs? filters=trim
  
    // The suggested type of intervention for the brief.
    text suggested_intervention_type? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["active", "brief", "v2"]
}
table STAKEHOLDERS {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    text name? filters=trim
    enum leverage_point? {
      values = ["Yes", "Partial", "No"]
    }
  
    text rationale? filters=trim
    enum source {
      values = ["Research", "Kora insights"]
    }
  
    int stakeholder_type_id? {
      table = "OS_STAKEHOLDER_TYPES"
    }
  
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    bool is_prioritized?
    int leverage_rank?
    text influence_on_problem_space? filters=trim
    text system_dynamics? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["active", "deprecated"]
}
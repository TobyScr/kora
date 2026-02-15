// Add STAKEHOLDERS record
query edit_stakeholder verb=PATCH {
  api_group = "Stakeholders"
  auth = "USER"

  input {
    dblink {
      table = "STAKEHOLDERS"
    }
  
    int stakeholder_id?
  }

  stack {
    db.add_or_edit STAKEHOLDERS {
      field_name = "id"
      field_value = $input.stakeholder_id
      data = {
        name                      : $input.name
        leverage_point            : $input.leverage_point
        rationale                 : $input.rationale
        source                    : $input.source
        stakeholder_type_id       : $input.stakeholder_type_id
        intervention_id           : $input.intervention_id
        is_prioritized            : $input.is_prioritized
        leverage_rank             : $input.leverage_rank
        influence_on_problem_space: $input.influence_on_problem_space
        system_dynamics           : $input.system_dynamics
      }
    } as $stakeholders
  }

  response = $stakeholders
  tags = ["deprecated"]
}
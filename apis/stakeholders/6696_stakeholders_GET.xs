// Query all STAKEHOLDERS records
query stakeholders verb=GET {
  api_group = "Stakeholders"
  auth = "USER"

  input {
    int intervention_id?
  }

  stack {
    db.query STAKEHOLDERS {
      where = $db.STAKEHOLDERS.intervention_id == $input.intervention_id
      return = {type: "list"}
      addon = [
        {
          name : "STAKEHOLDER_DYNAMICS_of_STAKEHOLDERS_1"
          input: {stakeholders_id: $output.id}
          addon: [
            {
              name : "OS_SYSTEM_DYNAMICS"
              input: {OS_SYSTEM_DYNAMICS_id: $output.os_system_dynamics_id}
              as   : "_os_system_dynamics"
            }
          ]
          as   : "_stakeholder_dynamics_of_stakeholders"
        }
        {
          name : "STAKEHOLDER_INFLUENCES_of_STAKEHOLDERS"
          input: {stakeholders_id: $output.id}
          addon: [
            {
              name : "OS_PROBLEM_INFLUENCES"
              input: {OS_PROBLEM_INFLUENCES_id: $output.os_problem_influences_id}
              as   : "_os_problem_influences"
            }
          ]
          as   : "_stakeholder_influences_of_stakeholders"
        }
        {
          name  : "OS_STAKEHOLDER_TYPES"
          output: ["name"]
          input : {OS_STAKEHOLDER_TYPES_id: $output.stakeholder_type_id}
          as    : "stakeholder_types_name"
        }
      ]
    } as $stakeholders
  }

  response = $stakeholders
  tags = ["deprecated"]
}
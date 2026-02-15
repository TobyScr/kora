query intervention_stakeholders verb=GET {
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
          name  : "OS_STAKEHOLDER_TYPES"
          output: ["name"]
          input : {OS_STAKEHOLDER_TYPES_id: $output.stakeholder_type_id}
          as    : "_os_stakeholder_types"
        }
      ]
    } as $model
  }

  response = $model
  tags = ["deprecated"]
}
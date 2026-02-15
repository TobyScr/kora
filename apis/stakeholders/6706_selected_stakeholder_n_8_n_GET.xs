query selected_stakeholder_n8n verb=GET {
  api_group = "Stakeholders"

  input {
    int intervention_id?
  }

  stack {
    db.query STAKEHOLDERS {
      where = $db.STAKEHOLDERS.intervention_id == $input.intervention_id && $db.STAKEHOLDERS.is_prioritized == true
      return = {type: "list"}
      addon = [
        {
          name : "STAKEHOLDERTYPES_TEST"
          input: {OS_STAKEHOLDER_TYPES_id: $output.stakeholder_types_id}
          as   : "_stakeholdertype"
        }
        {
          name  : "OS_STAKEHOLDER_TYPES"
          output: ["name"]
          input : {OS_STAKEHOLDER_TYPES_id: $output.stakeholder_type_id}
          as    : "_os_stakeholder_types"
        }
      ]
    } as $STAKEHOLDERS1
  }

  response = $STAKEHOLDERS1
  tags = ["deprecated"]
}
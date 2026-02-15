query stakeholder_test verb=GET {
  api_group = "Stakeholders"

  input {
    int intervention_id?
  }

  stack {
    db.query STAKEHOLDERS {
      where = $db.STAKEHOLDERS.intervention_id == $input.intervention_id
      return = {type: "list"}
      addon = [
        {
          name  : "STAKEHOLDERTYPES_TEST"
          output: ["name"]
          input : {OS_STAKEHOLDER_TYPES_id: $output.$this}
          as    : "os_stakeholder_types_id"
        }
      ]
    } as $STAKEHOLDERS1
  }

  response = $STAKEHOLDERS1
  tags = ["deprecated"]
}
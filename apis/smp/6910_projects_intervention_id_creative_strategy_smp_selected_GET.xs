// Query the selected SM_PROPOSITION record
query "projects/{intervention_id}/creative-strategy/smp_selected" verb=GET {
  api_group = "SMP"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query SM_PROPOSITION {
      where = $db.SM_PROPOSITION.intervention_id == $input.intervention_id && $db.SM_PROPOSITION.selected == true
      return = {type: "single"}
    } as $model
  }

  response = $model
  tags = ["v2", "smp"]
}
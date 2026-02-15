// Query all SM_PROPOSITION records
query "projects/{intervention_id}/creative-strategy/smp" verb=GET {
  api_group = "SMP"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query SM_PROPOSITION {
      where = $db.SM_PROPOSITION.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $model
  }

  response = $model
  tags = ["v2", "smp"]
}
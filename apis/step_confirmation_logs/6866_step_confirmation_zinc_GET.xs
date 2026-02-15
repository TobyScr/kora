// Query all step-confirmation-zinc records
query step_confirmation_zinc verb=GET {
  api_group = "Step Confirmation Logs"
  auth = "USER"

  input {
    int intervention_id?
  }

  stack {
    db.query "step-confirmation-zinc" {
      where = $db.step_confirmation_zinc.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $model
  }

  response = $model
}
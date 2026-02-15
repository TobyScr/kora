// Add step-confirmation-zinc record
query step_confirmation_zinc verb=POST {
  api_group = "Step Confirmation Logs"
  auth = "USER"

  input {
    dblink {
      table = "step-confirmation-zinc"
    }
  }

  stack {
    db.add "step-confirmation-zinc" {
      data = {
        confirmed_at   : $input.confirmed_at
        intervention_id: $input.intervention_id
        step_id        : $input.step_id
        user_id        : $input.user_id
      }
    } as $model
  }

  response = $model
}
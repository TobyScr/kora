query user_analytics verb=POST {
  api_group = "Analytics"
  auth = "USER"

  input {
    dblink {
      table = "USER_ANALYTICS"
    }
  }

  stack {
    db.add USER_ANALYTICS {
      data = {
        created_at     : "now"
        user_id        : $input.user_id
        event_id       : $input.event_id
        intervention_id: $input.intervention_id
      }
    } as $model
  }

  response = $model
  tags = ["user_analytics"]
}
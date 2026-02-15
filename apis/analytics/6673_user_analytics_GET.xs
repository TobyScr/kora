query user_analytics verb=GET {
  api_group = "Analytics"
  auth = "USER"

  input {
  }

  stack {
    db.query USER_ANALYTICS {
      return = {type: "list"}
      addon = [
        {
          name  : "event_type"
          output: ["event_name"]
          input : {EVENT_TYPE_id: $output.event_id}
          as    : "_event_type"
        }
        {
          name  : "intervention"
          output: ["name"]
          input : {INTERVENTION_id: $output.intervention_id}
          as    : "intervention"
        }
      ]
    } as $model
  }

  response = $model
}
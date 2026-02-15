table "step-confirmation-zinc" {
  auth = false

  schema {
    int id
    timestamp confirmed_at?
    int intervention_id?
    int step_id?
    int user_id? {
      table = "USER"
    }
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
  ]
}
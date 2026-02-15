table "nav-fix-zinc" {
  auth = true

  schema {
    int id
    text name?
    text parent_id?
    int level?
    int order?
    int id2?
    text ai_slug?
    int triggers?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
  ]
}
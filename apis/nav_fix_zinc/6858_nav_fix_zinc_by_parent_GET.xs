// Query all nav-fix-zinc records
query nav_fix_zinc_by_parent verb=GET {
  api_group = "nav-fix-zinc"
  auth = "USER"

  input {
    int parent_id?
  }

  stack {
    db.query "nav-fix-zinc" {
      where = $db.nav_fix_zinc.parent_id == $input.parent_id
      return = {type: "list"}
    } as $model
  }

  response = $model
}
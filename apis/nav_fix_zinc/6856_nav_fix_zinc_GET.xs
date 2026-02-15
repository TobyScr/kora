// Query all nav-fix-zinc records
query nav_fix_zinc verb=GET {
  api_group = "nav-fix-zinc"

  input {
  }

  stack {
    db.query "nav-fix-zinc" {
      return = {type: "list"}
    } as $model
  }

  response = $model
}
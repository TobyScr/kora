// Get nav-fix-zinc record
query "nav_fix_zinc/{nav_fix_zinc_id}" verb=GET {
  api_group = "nav-fix-zinc"

  input {
    int nav_fix_zinc_id? filters=min:1
  }

  stack {
    db.get "nav-fix-zinc" {
      field_name = "id"
      field_value = $input.nav_fix_zinc_id
    } as $model
  
    precondition ($model != null) {
      error_type = "notfound"
      error = "Not Found"
    }
  }

  response = $model
}
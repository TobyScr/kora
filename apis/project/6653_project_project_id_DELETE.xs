query "project/{project_id}" verb=DELETE {
  api_group = "Project"
  auth = "USER"

  input {
    int project_id? filters=min:1
  }

  stack {
    db.del PROJECT {
      field_name = "id"
      field_value = $input.project_id
    }
  }

  response = "success"
}
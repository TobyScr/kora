query "project/{project_id}" verb=GET {
  api_group = "Project"

  input {
    int project_id? filters=min:1
  }

  stack {
    db.get PROJECT {
      field_name = "id"
      field_value = $input.project_id
    } as $result
  
    precondition ($result != null) {
      error_type = "notfound"
      error = "Not Found"
    }
  }

  response = $result
}
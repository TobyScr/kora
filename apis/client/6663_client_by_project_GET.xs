query client_by_project verb=GET {
  api_group = "Client"
  auth = "USER"

  input {
    int project_id?
  }

  stack {
    db.query PROJECT {
      where = $db.PROJECT.id == $input.project_id
      return = {type: "single"}
      output = [
        "id"
        "created_at"
        "name"
        "client_id"
        "number_of_interventions"
        "last_updated_at"
        "is_deleted"
      ]
    } as $PROJECT1
  }

  response = $model
}
query "project/{project_id}" verb=PATCH {
  api_group = "Project"
  auth = "USER"

  input {
    dblink {
      table = "PROJECT"
      override = {
        client_id              : {hidden: true}
        is_deleted             : {hidden: true}
        number_of_interventions: {hidden: true}
      }
    }
  
    int project_id? {
      table = "PROJECT"
    }
  }

  stack {
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch PROJECT {
      field_name = "id"
      field_value = $input.project_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
}
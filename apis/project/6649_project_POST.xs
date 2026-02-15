// Creates a new project
query project verb=POST {
  api_group = "Project"
  auth = "USER"

  input {
    dblink {
      table = "PROJECT"
      override = {
        is_deleted             : {hidden: true}
        description            : {hidden: true}
        last_updated_at        : {hidden: true}
        number_of_interventions: {hidden: true}
      }
    }
  }

  stack {
    db.get CLIENT {
      field_name = "id"
      field_value = $input.client_id
    } as $CLIENT1
  
    precondition ($CLIENT1 != null) {
      error_type = "notfound"
      error = "Client not found."
    }
  
    db.add PROJECT {
      data = {
        created_at             : "now"
        name                   : $input.name
        client_id              : $input.client_id
        number_of_interventions: 0
        last_updated_at        : now
        is_deleted             : false
      }
    } as $result
  }

  response = $result
}
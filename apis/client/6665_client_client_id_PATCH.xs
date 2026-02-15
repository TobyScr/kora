// Edit a  given client
query "client/{client_id}" verb=PATCH {
  api_group = "Client"
  auth = "USER"

  input {
    int client_id? filters=min:1
    dblink {
      table = "CLIENT"
    }
  }

  stack {
    db.query CLIENT {
      where = $db.CLIENT.id == $input.client_id && $db.CLIENT.is_deleted == false
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Entity not found."
    }
  
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch CLIENT {
      field_name = "id"
      field_value = $input.client_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
}
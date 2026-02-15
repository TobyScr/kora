// Delete a given client
query "client/{client_id}" verb=DELETE {
  api_group = "Client"
  auth = "USER"

  input {
    int client_id? filters=min:1
    bool soft_delete?=true
  }

  stack {
    db.query CLIENT {
      where = $db.CLIENT.id == $input.client_id
      return = {type: "exists"}
    } as $EXISTS
  
    conditional {
      if ($EXISTS) {
        conditional {
          if ($input.soft_delete) {
            db.edit CLIENT {
              field_name = "id"
              field_value = $input.client_id
              data = {is_deleted: true}
            } as $CLIENT1
          }
        
          else {
            db.del CLIENT {
              field_name = "id"
              field_value = $input.client_id
            }
          }
        }
      }
    }
  }

  response = null
}
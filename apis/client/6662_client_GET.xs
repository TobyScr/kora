// Query all clients (doesnt include soft deleted ones)
query client verb=GET {
  api_group = "Client"
  auth = "USER"

  input {
  }

  stack {
    db.query CLIENT {
      where = $db.CLIENT.is_deleted == false
      return = {type: "list"}
    } as $result
  }

  response = $result
}
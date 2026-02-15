query client verb=POST {
  api_group = "Client"
  auth = "USER"

  input {
    // The name of the client (compulsory)
    text name
  
    // A description of the client (nullable and optional)
    text? description?
  
    // Whether the client record is marked as deleted (nullable, optional, defaults to false)
    bool? is_deleted?
  }

  stack {
    db.add CLIENT {
      data = {
        created_at : "now"
        name       : $input.name
        description: $input.description
        is_deleted : $input.is_deleted
      }
    } as $model
  }

  response = $model
}
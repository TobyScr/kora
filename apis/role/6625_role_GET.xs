// Query all role records
query role verb=GET {
  api_group = "role"
  auth = "USER"

  input {
  }

  stack {
    db.query ROLE {
      where = $db.ROLE.id != 1
      return = {type: "list"}
    } as $role
  }

  response = $role
}
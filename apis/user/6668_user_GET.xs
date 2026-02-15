query user verb=GET {
  api_group = "User"
  auth = "USER"

  input {
  }

  stack {
    db.query USER {
      return = {type: "list"}
      addon = [
        {
          name  : "ROLE"
          output: ["name"]
          input : {ROLE_id: $output.role_id}
          as    : "_role"
        }
      ]
    } as $result
  }

  response = $result
}
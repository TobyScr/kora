query test_n8n_auth verb=GET {
  api_group = "Test n8n Auth"

  input {
    int int_id?
  }

  stack {
    db.query INTERVENTION {
      where = $db.INTERVENTION.id == $input.int_id
      return = {type: "list"}
    } as $INTERVENTION1
  }

  response = $INTERVENTION1
}
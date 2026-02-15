table OS_MESSAGE_SOURCE {
  auth = false

  schema {
    int id
    text name? filters=trim
  }

  index = [{type: "primary", field: [{name: "id"}]}]
  tags = ["active"]
}
table OS_STRATEGY_TYPE {
  auth = false

  schema {
    int id
    text type? filters=trim
  }

  index = [{type: "primary", field: [{name: "id"}]}]
  tags = ["v2", "strategy"]
}
middleware check_api_key {
  input {
    json vars
    enum type {
      values = ["pre", "post"]
    }
  }

  stack {
  }

  response = null
  response_strategy = "merge"
  exception_policy = "silent"
  history = 1000
}
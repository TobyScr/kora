// Query all OS_HELPER_TEXT records
query os_helper_text verb=GET {
  api_group = "Helper Sidebar"

  input {
  }

  stack {
    db.query OS_HELPER_TEXT {
      return = {type: "list"}
    } as $os_helper_text
  }

  response = $os_helper_text
}
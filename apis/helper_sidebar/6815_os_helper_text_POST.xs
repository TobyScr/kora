// Add OS_HELPER_TEXT record
query os_helper_text verb=POST {
  api_group = "Helper Sidebar"

  input {
    dblink {
      table = "OS_HELPER_TEXT"
    }
  }

  stack {
    db.add OS_HELPER_TEXT {
      data = {created_at: "now"}
    } as $os_helper_text
  }

  response = $os_helper_text
}
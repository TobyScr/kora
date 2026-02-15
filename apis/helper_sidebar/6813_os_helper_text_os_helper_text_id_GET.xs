// Get OS_HELPER_TEXT record
query "os_helper_text/{os_helper_text_id}" verb=GET {
  api_group = "Helper Sidebar"

  input {
    int os_helper_text_id? filters=min:1
  }

  stack {
    db.get OS_HELPER_TEXT {
      field_name = "id"
      field_value = $input.os_helper_text_id
    } as $os_helper_text
  
    precondition ($os_helper_text != null) {
      error_type = "notfound"
      error = "Not Found."
    }
  }

  response = $os_helper_text
}
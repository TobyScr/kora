// Delete OS_HELPER_TEXT record.
query "os_helper_text/{os_helper_text_id}" verb=DELETE {
  api_group = "Helper Sidebar"

  input {
    int os_helper_text_id? filters=min:1
  }

  stack {
    db.del OS_HELPER_TEXT {
      field_name = "id"
      field_value = $input.os_helper_text_id
    }
  }

  response = null
}
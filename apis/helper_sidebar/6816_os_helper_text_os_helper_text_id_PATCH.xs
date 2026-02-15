// Edit OS_HELPER_TEXT record
query "os_helper_text/{os_helper_text_id}" verb=PATCH {
  api_group = "Helper Sidebar"

  input {
    int os_helper_text_id? filters=min:1
    dblink {
      table = "OS_HELPER_TEXT"
    }
  }

  stack {
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch OS_HELPER_TEXT {
      field_name = "id"
      field_value = $input.os_helper_text_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $os_helper_text
  }

  response = $os_helper_text
}
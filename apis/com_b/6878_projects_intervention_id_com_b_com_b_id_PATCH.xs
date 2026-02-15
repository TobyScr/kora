// Edit COM_B record
query "projects/{intervention_id}/com-b/{com_b_id}" verb=PATCH {
  api_group = "COM-B"
  auth = "USER"

  input {
    uuid com_b_id?
    dblink {
      table = "COM_B"
    }
  }

  stack {
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {intervention_id: $input.intervention_id, step: "COM-B"}
    } as $func1
  
    db.query COM_B {
      where = $db.COM_B.intervention_id == $input.intervention_id && $db.COM_B.id == $input.com_b_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Entity not found."
    }
  
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch COM_B {
      field_name = "id"
      field_value = $input.com_b_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
  tags = ["com_b", "v2"]
}
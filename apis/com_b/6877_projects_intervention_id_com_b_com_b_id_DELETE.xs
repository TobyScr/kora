// Delete COM_B record
query "projects/{intervention_id}/com-b/{com_b_id}" verb=DELETE {
  api_group = "COM-B"
  auth = "USER"

  input {
    uuid com_b_id?
    int intervention_id {
      table = "INTERVENTION"
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
  
    db.del COM_B {
      field_name = "id"
      field_value = $input.com_b_id
    }
  }

  response = null
  tags = ["com_b", "v2"]
}
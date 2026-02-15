// Select or Deselect a given com-b record
query "projects/{intervention_id}/com-b/{com_b_id}/toggle" verb=POST {
  api_group = "COM-B"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    uuid com_b_id {
      table = "COM_B"
    }
  }

  stack {
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {intervention_id: $input.intervention_id, step: "COM-B"}
    }
  
    db.query COM_B {
      where = $db.COM_B.intervention_id == $input.intervention_id && $db.COM_B.id == $input.com_b_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Entity not found."
    }
  
    // Determine if we are selecting o deselecting the given entity
  
    db.get COM_B {
      field_name = "id"
      field_value = $input.com_b_id
    } as $TO_SELECT|get:"selected":false|not
  
    conditional {
      if ($TO_SELECT) {
        db.query COM_B {
          where = $db.COM_B.intervention_id == $input.intervention_id && $db.COM_B.selected == true
          return = {type: "count"}
        } as $SELECTED_COUNT
      
        conditional {
          if ($SELECTED_COUNT >= 3) {
            // If there are already 3 selected entities deselect one of them
          
            db.query COM_B {
              where = $db.COM_B.intervention_id == $input.intervention_id && $db.COM_B.selected == true
              return = {type: "single"}
              output = ["id"]
            } as $TO_DESELECT
          
            db.edit COM_B {
              field_name = "id"
              field_value = $TO_DESELECT.id
              data = {selected: false}
            }
          }
        }
      
        db.edit COM_B {
          field_name = "id"
          field_value = $input.com_b_id
          data = {selected: true}
        }
      }
    
      else {
        db.edit COM_B {
          field_name = "id"
          field_value = $input.com_b_id
          data = {selected: false}
        }
      }
    }
  }

  response = null
  tags = ["com_b", "v2"]
}
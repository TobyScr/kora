// Add a new record to TFD_CARD table
query "projects/{intervention_id}/behavioral-framing/tfd" verb=POST {
  api_group = "TFD"

  input {
    dblink {
      table = "TFD_CARD"
      override = {selected: {hidden: true}, created_at: {hidden: true}}
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Think-Feel-Do"
      }
    } as $func2
  
    var $comb_1 {
      value = null
    }
  
    var $comb_2 {
      value = null
    }
  
    conditional {
      if (($input.com_b1_id|is_empty) == false) {
        db.query COM_B {
          where = $db.COM_B.id == $input.com_b1_id
          return = {type: "exists"}
        } as $EXISTS
      
        precondition ($EXISTS) {
          error_type = "notfound"
          error = "COM-B not found."
        }
      
        var.update $comb_1 {
          value = $input.com_b1_id
        }
      }
    }
  
    conditional {
      if (($input.com_b2_id|is_empty) == false) {
        db.query COM_B {
          where = $db.COM_B.id == $input.com_b2_id
          return = {type: "exists"}
        } as $EXISTS
      
        precondition ($EXISTS) {
          error_type = "notfound"
          error = "COM-B not found."
        }
      
        var.update $comb_2 {
          value = $input.com_b2_id
        }
      }
    }
  
    precondition ($comb_1 != $comb_2) {
      error_type = "inputerror"
      error = "Can't reference the same COM-B twice."
    }
  
    db.add TFD_CARD {
      data = {
        created_at     : now
        intervention_id: $input.intervention_id
        com_b1_id      : $comb_1
        com_b2_id      : $comb_2
        current_think  : $input.current_think
        current_feel   : $input.current_feel
        current_do     : $input.current_do
        future_think   : $input.future_think
        future_feel    : $input.future_feel
        future_do      : $input.future_do
        selected       : false
      }
    
      addon = [
        {
          name : "COM_B"
          input: {COM_B_id: $output.com_b1_id}
          as   : "com_b1"
        }
        {
          name : "COM_B"
          input: {COM_B_id: $input.com_b2_id}
          as   : "com_b2"
        }
      ]
    } as $model
  }

  response = $model
  tags = ["v2", "think_feel_do"]
}
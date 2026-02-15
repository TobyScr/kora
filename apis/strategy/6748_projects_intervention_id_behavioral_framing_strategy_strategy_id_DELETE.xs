// Delete STRATEGY record
query "projects/{intervention_id}/behavioral-framing/strategy/{strategy_id}" verb=DELETE {
  api_group = "Strategy"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    uuid strategy_id?
  }

  stack {
    db.query STRATEGY {
      where = $db.STRATEGY.intervention_id == $input.intervention_id && $db.STRATEGY.id == $input.strategy_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Entity Intervention not found."
    }
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Strategy"
      }
    } as $func2
  
    db.del STRATEGY {
      field_name = "id"
      field_value = $input.strategy_id
    }
  }

  response = null
  tags = ["v2", "strategy"]
}
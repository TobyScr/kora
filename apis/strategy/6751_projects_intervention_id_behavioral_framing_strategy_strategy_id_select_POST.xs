// Select a given strategy and deselect the previous one
query "projects/{intervention_id}/behavioral-framing/strategy/{strategy_id}/select" verb=POST {
  api_group = "Strategy"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    uuid strategy_id {
      table = "STRATEGY"
    }
  }

  stack {
    db.query STRATEGY {
      where = $db.STRATEGY.intervention_id == $input.intervention_id && $db.STRATEGY.id == $input.strategy_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Strategy not found."
    }
  
    db.query STRATEGY {
      where = $db.STRATEGY.selected == true && $db.STRATEGY.intervention_id == $input.intervention_id && $db.STRATEGY.id != $input.strategy_id
      return = {type: "single"}
      output = ["id"]
    } as $PREVIOUS_SELECTED
  
    conditional {
      if ($PREVIOUS_SELECTED != null) {
        db.edit STRATEGY {
          field_name = "id"
          field_value = $PREVIOUS_SELECTED.id
          data = {selected: false}
        } as $DESELECTED
      }
    }
  
    db.edit STRATEGY {
      field_name = "id"
      field_value = $input.strategy_id
      data = {selected: true}
    } as $SELECTED
  }

  response = "success"
  tags = ["v2", "strategy"]
}
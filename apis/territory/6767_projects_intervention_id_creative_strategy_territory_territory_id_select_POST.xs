// Select a given Territory and deselect the previous one
query "projects/{intervention_id}/creative-strategy/territory/{territory_id}/select" verb=POST {
  api_group = "Territory"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    uuid territory_id {
      table = "TERRITORY"
    }
  }

  stack {
    db.query TERRITORY {
      where = $db.TERRITORY.intervention_id == $input.intervention_id && $db.TERRITORY.id == $input.territory_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
    }
  
    db.query TERRITORY {
      where = $db.TERRITORY.intervention_id == $input.intervention_id && $db.TERRITORY.id != $input.territory_id && $db.TERRITORY.selected == true
      return = {type: "single"}
      output = ["id"]
    } as $PREVIOUS_SELECTED
  
    conditional {
      if ($PREVIOUS_SELECTED != null) {
        db.edit TERRITORY {
          field_name = "id"
          field_value = $PREVIOUS_SELECTED.id
          data = {selected: false}
        } as $DESELECTED
      }
    }
  
    db.edit TERRITORY {
      field_name = "id"
      field_value = $input.territory_id
      data = {selected: true}
    } as $SELECTED
  }

  response = "success"
  tags = ["v2", "territory"]
}
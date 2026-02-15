// Delete TERRITORY record ensuring at least one exists
query "projects/{intervention_id}/creative-strategy/territory/{territory_id}" verb=DELETE {
  api_group = "Territory"
  auth = "USER"

  input {
    uuid territory_id?
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query TERRITORY {
      where = $db.TERRITORY.intervention_id == $input.intervention_id && $db.TERRITORY.id == $input.territory_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Territory not found."
    }
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Territory"
      }
    } as $func1
  
    db.query TERRITORY {
      where = $db.TERRITORY.intervention_id == $input.intervention_id
      return = {type: "count"}
    } as $TERRITORY_COUNT
  
    precondition ($TERRITORY_COUNT > 1) {
      error_type = "unauthorized"
      error = "There must be at least one territory."
    }
  
    db.del TERRITORY {
      field_name = "id"
      field_value = $input.territory_id
    }
  }

  response = "success"
  tags = ["v2", "territory"]
}
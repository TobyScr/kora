// Edit TERRITORY record
query "projects/{intervention_id}/creative-strategy/territory/{territory_id}" verb=PATCH {
  api_group = "Territory"
  auth = "USER"

  input {
    uuid territory_id?
    dblink {
      table = "TERRITORY"
      override = {rationale: {hidden: true}, recomended: {hidden: true}}
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
    }
  
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch TERRITORY {
      field_name = "id"
      field_value = $input.territory_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
  tags = ["v2", "territory"]
}
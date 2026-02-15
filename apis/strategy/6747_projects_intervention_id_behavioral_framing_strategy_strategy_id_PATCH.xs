// Edit STRATEGY record
query "projects/{intervention_id}/behavioral-framing/strategy/{strategy_id}" verb=PATCH {
  api_group = "Strategy"
  auth = "USER"

  input {
    uuid strategy_id?
    dblink {
      table = "STRATEGY"
      override = {
        type_id   : {hidden: true}
        selected  : {hidden: true}
        created_at: {hidden: true}
        recomended: {hidden: true}
      }
    }
  }

  stack {
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Strategy"
      }
    } as $func2
  
    db.query STRATEGY {
      where = $db.STRATEGY.intervention_id == $input.intervention_id && $db.STRATEGY.id == $input.strategy_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Entity Intervention not found."
    }
  
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch STRATEGY {
      field_name = "id"
      field_value = $input.strategy_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
  tags = ["v2", "strategy"]
}
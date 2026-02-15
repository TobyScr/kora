// Edit STRATEGY record
query "select-strategy/{strategy_id}" verb=PATCH {
  api_group = "Strategy"
  auth = "USER"

  input {
    uuid strategy_id?
    dblink {
      table = "STRATEGY"
      override = {
        type       : {hidden: true}
        pros_cons  : {hidden: true}
        created_at : {hidden: true}
        recomended : {hidden: true}
        description: {hidden: true}
      }
    }
  }

  stack {
    db.query INTERVENTION {
      where = $db.INTERVENTION.id == $input.intervention_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Intervention not found."
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
  tags = ["deprecated"]
}
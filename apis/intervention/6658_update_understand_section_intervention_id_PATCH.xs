query "update-understand-section/{intervention_id}" verb=PATCH {
  api_group = "Intervention"
  auth = "USER"

  input {
    int intervention_id? filters=min:1
    dblink {
      table = "INTERVENTION"
      override = {
        name                       : {hidden: true}
        is_deleted                 : {hidden: true}
        project_id                 : {hidden: true}
        description                : {hidden: true}
        helper_text                : {hidden: true}
        last_modified              : {hidden: true}
        intervention_stage_pending : {hidden: true}
        intervention_stage_finished: {hidden: true}
      }
    }
  }

  stack {
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch INTERVENTION {
      field_name = "id"
      field_value = $input.intervention_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
}
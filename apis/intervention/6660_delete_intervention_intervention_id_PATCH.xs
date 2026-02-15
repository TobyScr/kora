query "delete-intervention/{intervention_id}" verb=PATCH {
  api_group = "Intervention"
  auth = "USER"

  input {
    int intervention_id? filters=min:1
    dblink {
      table = "INTERVENTION"
      override = {
        name                       : {hidden: true}
        chat_id                    : {hidden: true}
        project_id                 : {hidden: true}
        description                : {hidden: true}
        helper_text                : {hidden: true}
        current_step               : {hidden: true}
        last_modified              : {hidden: true}
        understand_section_id      : {hidden: true}
        intervention_stage_pending : {hidden: true}
        intervention_stage_finished: {hidden: true}
      }
    }
  }

  stack {
    db.get INTERVENTION {
      field_name = "id"
      field_value = $input.intervention_id
      output = ["id", "project_id", "is_deleted"]
    } as $INTERVENTION
  
    precondition ($INTERVENTION != null) {
      error_type = "notfound"
      error = "Intervention not found."
    }
  
    db.get PROJECT {
      field_name = "id"
      field_value = $INTERVENTION.project_id
      output = ["id", "number_of_interventions"]
    } as $PROJECT
  
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch INTERVENTION {
      field_name = "id"
      field_value = $input.intervention_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  
    conditional {
      if ($INTERVENTION.is_deleted == false) {
        db.edit PROJECT {
          field_name = "id"
          field_value = $PROJECT.id
          data = {
            number_of_interventions: $PROJECT.number_of_interventions|subtract:1
          }
        } as $PROJECT1
      }
    }
  }

  response = $model
}
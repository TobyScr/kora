// Creates a new intervention
query intervention verb=POST {
  api_group = "Intervention"
  auth = "USER"

  input {
    dblink {
      table = "INTERVENTION"
      override = {
        is_deleted                    : {hidden: true}
        helper_text                   : {hidden: true}
        current_step                  : {hidden: true}
        last_modified                 : {hidden: true}
        intervention_stage_pending    : {hidden: true}
        intervention_stage_finished   : {hidden: true}
        intervention_stage_in_progress: {hidden: true}
      }
    }
  }

  stack {
    db.get WORKFLOW_STEP {
      field_name = "name"
      field_value = "Brief Overview"
      output = ["id"]
    } as $FIRST_STEP
  
    precondition ($FIRST_STEP != null) {
      error_type = "notfound"
    }
  
    db.add INTERVENTION {
      data = {
        created_at   : "now"
        name         : $input.name
        project_id   : $input.project_id
        is_deleted   : false
        last_modified: null
        current_step : $FIRST_STEP.id
        chat_id      : $input.chat_id
      }
    } as $result
  
    db.get PROJECT {
      field_name = "id"
      field_value = $result.project_id
      output = [
        "id"
        "created_at"
        "name"
        "client_id"
        "number_of_interventions"
        "last_updated_at"
        "is_deleted"
      ]
    } as $project
  
    db.edit PROJECT {
      field_name = "id"
      field_value = $project.id
      data = {
        number_of_interventions: $project.number_of_interventions|add:1
        last_updated_at        : now
      }
    } as $project
  }

  response = $result
}
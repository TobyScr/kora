// Add STAKEHOLDERS record
query "projects/{intervention_id}/add-system-map" verb=POST {
  api_group = "System Map"

  input {
    dblink {
      table = "SYSTEM_MAP"
    }
  }

  stack {
    db.get INTERVENTION {
      field_name = "id"
      field_value = $input.intervention_id
    } as $INTERVENTION
  
    precondition ($INTERVENTION != null) {
      error_type = "notfound"
    }
  
    db.add SYSTEM_MAP {
      data = {
        created_at     : "now"
        intervention_id: $input.intervention_id
        challenge      : $input.challenge
        description    : $input.description
        is_selected    : false
      }
    } as $model
  }

  response = $model
  tags = ["deprecated"]
}
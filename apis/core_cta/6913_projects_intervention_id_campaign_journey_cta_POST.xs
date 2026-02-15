// Add CTA record
query "projects/{intervention_id}/campaign-journey/cta" verb=POST {
  api_group = "Core CTA"

  input {
    dblink {
      table = "CTA"
      override = {selected: {hidden: true}}
    }
  }

  stack {
    !function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    }
  
    !function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Core CTA"
      }
    } as $func1
  
    db.add CTA {
      data = {
        created_at     : "now"
        intervention_id: $input.intervention_id
        title          : $input.title
        validations    : $input.validations
        selected       : false
      }
    } as $model
  }

  response = $model
  tags = ["v2", "cta"]
}
// Edit CTA record
query "projects/{intervention_id}/campaign-journey/cta/{cta_id}" verb=PATCH {
  api_group = "Core CTA"
  auth = "USER"

  input {
    uuid cta_id?
    dblink {
      table = "CTA"
    }
  }

  stack {
    db.query CTA {
      where = $db.CTA.id == $input.cta_id && $db.CTA.intervention_id == $input.intervention_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "CTA not found."
    }
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Core CTA"
      }
    }
  
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch CTA {
      field_name = "id"
      field_value = $input.cta_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
  tags = ["v2", "cta"]
}
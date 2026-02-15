// Delete CTA record
query "projects/{intervention_id}/campaign-journey/cta/{cta_id}" verb=DELETE {
  api_group = "Core CTA"
  auth = "USER"

  input {
    uuid cta_id?
    int intervention_id? {
      table = "INTERVENTION"
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
    } as $func1
  
    db.del CTA {
      field_name = "id"
      field_value = $input.cta_id
    }
  }

  response = $func1
  tags = ["v2", "cta"]
}
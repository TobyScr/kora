// Select a given cta and deselect the previous one
query "projects/{intervention_id}/campaign-journey/cta/{cta_id}/select" verb=POST {
  api_group = "Core CTA"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    uuid cta_id {
      table = "STRATEGY"
    }
  }

  stack {
    db.query CTA {
      where = $db.CTA.intervention_id == $input.intervention_id && $db.CTA.id == $input.cta_id
      return = {type: "list"}
    } as $CTA_exists
  
    precondition ($CTA_exists) {
      error_type = "notfound"
      error = "Strategy not found."
    }
  
    db.query CTA {
      where = $db.CTA.intervention_id == $input.intervention_id && $db.CTA.selected == true && $db.CTA.id != $input.cta_id
      return = {type: "single"}
    } as $previous_cta
  
    conditional {
      if ($previous_cta != null) {
        db.edit CTA {
          field_name = "id"
          field_value = $previous_cta.id
          data = {selected: false}
        } as $deselected_cta
      }
    }
  
    db.edit CTA {
      field_name = "id"
      field_value = $input.cta_id
      data = {selected: true}
    } as $selected_CTA
  }

  response = "success"
  tags = ["v2", "cta"]
}
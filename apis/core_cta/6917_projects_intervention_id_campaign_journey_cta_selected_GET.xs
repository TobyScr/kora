// Query selected CTA record
query "projects/{intervention_id}/campaign-journey/cta/selected" verb=GET {
  api_group = "Core CTA"
  auth = "USER"

  input {
    int intervention_id?
  }

  stack {
    db.query CTA {
      where = $db.CTA.intervention_id == $input.intervention_id && $db.CTA.selected == true
      return = {type: "single"}
    } as $model
  }

  response = $model
  tags = ["v2", "cta"]
}
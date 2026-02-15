// Query all CTA records
query "projects/{intervention_id}/campaign-journey/cta" verb=GET {
  api_group = "Core CTA"
  auth = "USER"

  input {
    int intervention_id?
  }

  stack {
    db.query CTA {
      where = $db.CTA.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $model
  }

  response = $model
  tags = ["v2", "cta"]
}
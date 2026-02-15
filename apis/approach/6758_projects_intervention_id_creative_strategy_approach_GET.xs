// Query the CREATIVE APPROACH OPTIONS
query "projects/{intervention_id}/creative-strategy/approach" verb=GET {
  api_group = "Approach"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query OS_APPROACH_OPTIONS {
      return = {type: "list"}
    } as $model
  }

  response = $model
  tags = ["v2", "approach"]
}
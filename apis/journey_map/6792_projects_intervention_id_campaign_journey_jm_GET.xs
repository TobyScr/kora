// Query all JOURNEY_MAP records
query "projects/{intervention_id}/campaign-journey/jm" verb=GET {
  api_group = "Journey Map"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query JOURNEY_MAP {
      where = $db.JOURNEY_MAP.intervention_id == $input.intervention_id
      return = {type: "list"}
      addon = [
        {
          name : "OS_JOURNEY_PHASE"
          input: {OS_JOURNEY_PHASE_id: $output.journey_phase_id}
          as   : "_os_journey_phase"
        }
      ]
    } as $model
  }

  response = $model
  tags = ["v2", "journey_map"]
}
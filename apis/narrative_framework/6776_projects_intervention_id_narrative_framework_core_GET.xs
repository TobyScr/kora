// Query all CORE_NARRATIVE records
query "projects/{intervention_id}/narrative-framework/core" verb=GET {
  api_group = "Narrative Framework"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query CORE_NARRATIVE {
      where = $db.CORE_NARRATIVE.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $model
  }

  response = $model
  tags = ["v2", "narrative_framework", "core_narrative"]
}
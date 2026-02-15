query research_by_intervention verb=GET {
  api_group = "Research"
  auth = "USER"

  input {
    int intervention_id?
  }

  stack {
    db.query RESEARCH {
      where = $db.RESEARCH.intervention_id == $input.intervention_id
      return = {type: "list"}
      output = [
        "id"
        "created_at"
        "intervention_id"
        "content"
        "proprietary_findings"
        "proprietary_links"
        "is_confirmed"
        "research_sections_id"
        "is_skipped"
        "proprietary_uploaded_files.access"
        "proprietary_uploaded_files.path"
        "proprietary_uploaded_files.name"
        "proprietary_uploaded_files.type"
        "proprietary_uploaded_files.size"
        "proprietary_uploaded_files.mime"
        "proprietary_uploaded_files.meta"
        "proprietary_uploaded_files.url"
      ]
    } as $model
  }

  response = $model
}
// Add DOCUMENT_INSIGHT record
query "projects/{intervention_id}/research/document_insight/add-insight" verb=POST {
  api_group = "Research"

  input {
    dblink {
      table = "DOCUMENT_INSIGHT"
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  
    db.add DOCUMENT_INSIGHT {
      data = {
        created_at  : "now"
        insight     : $input.insight
        source      : $input.source
        page        : $input.page
        sectionTitle: $input.sectionTitle
        keywords    : $input.keywords
        importance  : $input.importance
      }
    } as $model
  }

  response = $model
}
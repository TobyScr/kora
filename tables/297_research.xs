// This table will store data for Research tab of Understand stage.
table RESEARCH {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    text content? filters=trim
    text? proprietary_findings? filters=trim
    text[]? proprietary_links? filters=trim
    attachment[]? proprietary_uploaded_files?
    int research_sections_id? {
      table = "RESEARCH_SECTIONS"
    }
  
    bool is_skipped?
    uuid[]? research_files_id? {
      table = "RESEARCH_Files_"
    }
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["research-table", "inactive"]
}
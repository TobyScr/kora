table RESEARCH_Files_ {
  auth = false

  schema {
    uuid id
    timestamp created_at?=now
    int intervention_id {
      table = "INTERVENTION"
    }
  
    enum status?=pending {
      values = ["completed", "pending", "started", "failed"]
    }
  
    enum type {
      values = ["findings", "file", "url"]
    }
  
    enum subsection {
      values = ["proprietary", "external", "deep", "existing", "findings"]
    }
  
    json value?
    attachment? file?
    int section_id? {
      table = "RESEARCH_SECTIONS"
    }
  
    text txt_value? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = [
    "active"
    "deep_research"
    "existing_research"
    "assumption_finding"
    "v2"
  ]
}
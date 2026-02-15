table RESEARCH_SECTIONS {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    text name? filters=trim
    int reseach_section_id?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["active"]
}
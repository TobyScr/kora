table DOCUMENT_INSIGHT {
  auth = false

  schema {
    uuid id
    timestamp created_at?=now
    text insight? filters=trim
    text source? filters=trim
    text page? filters=trim
    text sectionTitle? filters=trim
    text[] keywords? filters=trim
    text importance? filters=trim
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    text description? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["active"]
}
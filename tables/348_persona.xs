table PERSONA {
  auth = false

  schema {
    uuid id
    timestamp created_at?=now
    int intervention_id {
      table = "INTERVENTION"
    }
  
    uuid demographics_id {
      table = "DEMOGRAPHICS"
    }
  
    uuid psychographics_id {
      table = "PSYCHOGRAPHICS"
    }
  
    uuid context_media_id? {
      table = "CONTEXT_MEDIA"
    }
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["active", "persona", "v2"]
}
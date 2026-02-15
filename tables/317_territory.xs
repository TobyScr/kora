table TERRITORY {
  auth = false

  schema {
    uuid id
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    timestamp created_at?=now
    text title?
    text description?
    text credibility?
    bool selected?
  }

  index = [{type: "primary", field: [{name: "id"}]}]
  tags = ["active", "v2", "territory"]
}
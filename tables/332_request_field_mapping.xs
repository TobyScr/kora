// Mapping for HypeAuditor API response fields to dabase equivalent
table REQUEST_FIELD_MAPPING {
  auth = false

  schema {
    int id
    enum type? {
      values = ["INSTAGRAM", "TIKTOK", "YOUTUBE", "X"]
    }
  
    text from? filters=trim
    text to? filters=trim
  }

  index = [{type: "primary", field: [{name: "id"}]}]
  tags = ["active", "hype_auditor"]
}
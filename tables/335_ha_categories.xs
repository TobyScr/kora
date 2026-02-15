// Taxonomy data from HyperAuditor taken from
// https://hypeauditor.readme.io/reference/taxonomy_v1
table HA_CATEGORIES {
  auth = false

  schema {
    int id
    int ha_id
    enum social {
      values = ["YOUTUBE", "TIKTOK", "INSTAGRAM"]
    }
  
    text title? filters=trim
  }

  index = [{type: "primary", field: [{name: "id"}]}]
  tags = ["active", "hype_auditor"]
}
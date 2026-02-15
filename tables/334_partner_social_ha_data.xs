// Standardized data from the HyperAuditor report
table PARTNER_SOCIAL_HA_DATA {
  auth = false

  schema {
    uuid id
    timestamp created_at?=now
    int partner_id? {
      table = "PARTNER"
    }
  
    enum social {
      values = ["INSTAGRAM", "YOUTUBE", "TIKTOK", "X"]
    }
  
    int followers_count?
    decimal engagement_rate?
    text engagement_rate_mark?="N/A" filters=trim
    int avg_likes?
    int avg_comments?
    int aqs_score?
    text aqs_score_description?="N/A"
    decimal sentiment_positive_prc?
    decimal sentiment_negative_prc?
    decimal sentiment_neutral_prc?
    int sentiment_score?
    json audience_type?
    json audience_reachability?
    json[] audience_countries?
    json[] audience_languages?
    int[] creator_categories?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
  ]

  tags = ["active", "hype_auditor"]
}
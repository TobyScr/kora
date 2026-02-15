table HA_FAILED_REPORTS {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    int partner_social_media_channel_id {
      table = "PARTNER_SOCIAL_MEDIA_CHANNEL"
    }
  
    text social_lookout filters=trim
    text lookup_value? filters=trim
    int code?
    int ha_code?
    text description? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["active", "hype_auditor"]
}
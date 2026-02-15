// Links partners to their specific social media channel instances
table PARTNER_SOCIAL_MEDIA_CHANNEL {
  auth = false

  schema {
    int id
    timestamp created_at?=now
  
    // Reference to the partner
    int partner? {
      table = "PARTNER"
    }
  
    // Reference to the social media channel type
    int social_media_channel? {
      table = "SOCIAL_MEDIA_CHANNEL"
    }
  
    // The URL of the partner's specific social media channel page
    text url? filters=trim
  
    // This column will store a boolean value based on the fact whether the Partner has been "deleted" or not.
    bool is_deleted?
  
    // This column will hold a boolean value based on the fact whether the social media is removed during the "edit" of Partner.
    bool is_removed?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["active"]
}
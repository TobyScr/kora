// Stores information about partners
table PARTNER {
  auth = false

  schema {
    int id
    timestamp created_at?=now
  
    // The name of the partner
    text name? filters=trim
  
    // A description of the partner
    text description? filters=trim
  
    // The geographical areas the partner focuses on
    text geographical_focus?
  
    // Whether the partner has previously engaged with Zinc
    bool past_zinc_engagement?
  
    // Description of past Zinc engagement, if any
    text past_zinc_engagement_description? filters=trim
  
    // Preferred incentives for collaboration with the partner
    text preferred_incentives_for_collaboration? filters=trim
  
    // The partner's preferred method of communication. A link to PARTNER_SOCIAL_MEDIA_CHANNEL table.
    int[]? preferred_communication_channel? {
      table = "PARTNER_SOCIAL_MEDIA_CHANNEL"
    }
  
    // This column will contain a list of Language table ids, showing what topics the partner has.
    int[] partner_languages? {
      table = "LANGUAGE"
    }
  
    // This column will contain a list of Audience table ids, showing what topics the partner has.
    int[] partner_audiences? {
      table = "AUDIENCE"
    }
  
    // This column will contain a list of Topic table ids, showing what topics the partner has.
    int[] partner_topics? {
      table = "TOPIC"
    }
  
    // This column will contain a list of Social Media Channel table ids, showing what topics the partner has.
    int[] partner_social_medias? {
      table = "SOCIAL_MEDIA_CHANNEL"
    }
  
    // This column will contain a list of Entity Type table ids, showing what topics the partner has.
    int[] partner_entity_types? {
      table = "ENTITY_TYPE"
    }
  
    // This column will contain a list of Country table ids, showing what topics the partner has.
    int[] partner_countries? {
      table = "COUNTRY"
    }
  
    // This column will contain a list of Partner Contact Detail table ids, showing what contacts the partner has.
    int[] partner_contact_details? {
      table = "PARTNER_CONTACT_DETAIL"
    }
  
    int? audience_follower_count?
  
    // This column will hold general description for audience. 
    text? audience_general_description?="N/A" filters=trim
  
    // This column allows the Partner to be "deleted" or archived.
    bool is_deleted?
  
    // This column will show the latest time a record is updated.
    timestamp? last_updated_at?
  
    // created_by
    int created_by? {
      table = "USER"
    }
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["active"]
}
// This endpoint is the main endpoint where the partner list is searched, filtered and sorted.
query "partners-interaction" verb=GET {
  api_group = "Partner"
  auth = "USER"

  input {
    int page?
    text keyword? filters=trim
    enum? order_by?=asc {
      values = ["asc", "desc"]
    }
  
    // This input contains a list of Language table ids used to filter based on languages of partner.
    int[] partner_languages?
  
    // This input contains a list of Topic table ids used to filter based on topics of partner.
    int[] partner_topics?
  
    // This input contains a list of Social Media Channel table ids used to filter based on social medias of partner.
    int[] partner_social_medias?
  
    int? minimum_social_media_followers?
    int? maximum_social_media_followers?
  
    // This input contains a list of Country table ids used to filter based on countries of partner.
    int[] partner_countries?
  
    // This input contains a list of Entity type table ids used to filter based on entity types of partner.
    int[] partner_entity_types?
  
    int created_by?
  }

  stack {
    var $externalSorting {
      value = {}
        |set:"sortBy":"name"
        |set:"orderBy":$input.order_by
    }
  
    var $dontChange {
      value = ""
    }
  
    db.query PARTNER {
      where = $db.PARTNER.name ==? $dontChange || ($db.partner.name includes? $input.keyword || $db.partner.description includes? $input.keyword || $db.partner.audience_general_description includes? $input.keyword) && ($db.partner.partner_languages overlaps? $input.partner_languages && $db.partner.partner_topics overlaps? $input.partner_topics && $db.partner.partner_social_medias overlaps? $input.partner_social_medias && $db.partner.partner_countries overlaps? $input.partner_countries && $db.partner.partner_entity_types overlaps? $input.partner_entity_types && $db.partner.is_deleted == false) && ($db.partner.audience_follower_count >=? $input.minimum_social_media_followers && $db.partner.audience_follower_count <=? $input.maximum_social_media_followers) && $db.PARTNER.created_by == $input.created_by
      sort = {partner.name: "asc"}
      override_sort = $externalSorting
      return = {
        type  : "list"
        paging: {page: $input.page, per_page: 25, totals: true}
      }
    
      output = [
        "itemsReceived"
        "curPage"
        "nextPage"
        "prevPage"
        "offset"
        "itemsTotal"
        "pageTotal"
        "items.id"
        "items.created_at"
        "items.name"
        "items.description"
        "items.geographical_focus"
        "items.past_zinc_engagement"
        "items.past_zinc_engagement_description"
        "items.preferred_incentives_for_collaboration"
        "items.preferred_communication_channel"
        "items.partner_languages"
        "items.partner_audiences"
        "items.partner_topics"
        "items.partner_social_medias"
        "items.partner_entity_types"
        "items.partner_countries"
        "items.audience_follower_count"
        "items.audience_general_description"
        "items.created_by"
      ]
    
      addon = [
        {
          name : "LANGUAGE"
          input: {LANGUAGE_id: $output.$this}
          as   : "items.partner_languages._language"
        }
        {
          name : "AUDIENCE"
          input: {AUDIENCE_id: $output.$this}
          as   : "items.partner_audiences._audience"
        }
        {
          name : "TOPIC"
          input: {TOPIC_id: $output.$this}
          as   : "items.partner_topics._topic"
        }
        {
          name : "SOCIAL_MEDIA_CHANNEL"
          input: {SOCIAL_MEDIA_CHANNEL_id: $output.$this}
          as   : "items.partner_social_medias._social_media"
        }
        {
          name : "COUNTRY"
          input: {COUNTRY_id: $output.$this}
          as   : "items.partner_countries._country"
        }
        {
          name : "ENTITY_TYPE"
          input: {ENTITY_TYPE_id: $output.$this}
          as   : "items.partner_entity_types._entity_type"
        }
      ]
    } as $model
  }

  response = $model
  tags = ["partners-filtering"]
}
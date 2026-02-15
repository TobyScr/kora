query "partners-filtered-sorted-public" verb=GET {
  api_group = "Partner"

  input {
    int page?
    text sortBy? filters=trim
    text orderBy? filters=trim
    text keyword? filters=trim
  }

  stack {
    var $external_sorting {
      value = {}
        |set:"sortBy":$input.sortBy
        |set:"orderBy":$input.orderBy
    }
  
    db.query PARTNER {
      where = $db.PARTNER.name includes $input.keyword || $db.PARTNER.description includes $input.keyword
      sort = {partner.name: "asc"}
      override_sort = $external_sorting
      return = {
        type  : "list"
        paging: {page: $input.page, per_page: 25, metadata: false}
      }
    
      output = [
        "id"
        "created_at"
        "name"
        "description"
        "entity_type"
        "country"
        "language"
        "contact_information"
        "audience"
        "geographical_focus"
        "past_zinc_engagement"
        "past_zinc_engagement_description"
        "preferred_communication_channel"
        "preferred_incentives_for_collaboration"
      ]
    } as $model
  }

  response = $model
}
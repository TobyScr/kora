query partner verb=GET {
  api_group = "Partner"
  auth = "USER"

  input {
    // This input determines which page results to retrieve.
    int page?=1
  }

  stack {
    db.query PARTNER {
      where = $db.PARTNER.is_deleted == false
      return = {
        type  : "list"
        paging: {page: $input.page, per_page: 25, totals: true}
      }
    
      addon = [
        {
          name : "PARTNER_SOCIAL_MEDIA_CHANNEL"
          input: {PARTNER_SOCIAL_MEDIA_CHANNEL_id: $output.$this}
          addon: [
            {
              name : "SOCIAL_MEDIA_CHANNEL"
              input: {SOCIAL_MEDIA_CHANNEL_id: $output.social_media_channel}
              as   : "_social_media_channel"
            }
          ]
          as   : "items.preferred_communication_channel._preferred_social_media"
        }
      ]
    } as $model
  
    var $result {
      value = []
    }
  
    foreach ($model.items) {
      each as $item {
        var $object {
          value = $item
        }
      
        function.run "" {
          input = {partner_id: $item.id}
        } as $partnerAudience
      
        var.update $object {
          value = $object
            |set:"_partner_audiences":$partnerAudience
        }
      
        function.run "" {
          input = {partner_id: $item.id}
        } as $partnerLanguage
      
        var.update $object {
          value = $object
            |set:"_partner_languages":$partnerLanguage
        }
      
        function.run "" {
          input = {partner_id: $item.id}
        } as $partnerTopic
      
        var.update $object {
          value = $object
            |set:"_partner_topics":$partnerTopic
        }
      
        var.update $result {
          value = $result|push:$object
        }
      }
    }
  }

  response = $result
}
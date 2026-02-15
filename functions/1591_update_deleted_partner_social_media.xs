// This function will update the "deleted" partner social media records.
function "Update deleted Partner Social Media" {
  input {
    int partner_id
  }

  stack {
    db.query PARTNER_SOCIAL_MEDIA_CHANNEL {
      where = $db.PARTNER_SOCIAL_MEDIA_CHANNEL.partner == $input.partner_id
      return = {type: "list"}
      output = ["id"]
    } as $PARTNER_SOCIAL_MEDIA_CHANNEL_IDS|get:"id":null|safe_array|filter_empty:""
  
    var $to_update {
      value = []
    }
  
    foreach ($PARTNER_SOCIAL_MEDIA_CHANNEL_IDS) {
      each as $item {
        array.push $to_update {
          value = {}
            |set:"id":$item
            |set:"is_deleted":true
        }
      }
    }
  
    conditional {
      if (($to_update|is_empty) == false) {
        db.bulk.patch PARTNER_SOCIAL_MEDIA_CHANNEL {
          items = $to_update
        }
      }
    }
  }

  response = "Partner Social Media deleted successfully."
}
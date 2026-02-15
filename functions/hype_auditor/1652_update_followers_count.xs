// Update Partners total follower count based on the data collected by HA
function "HypeAuditor/Update Followers Count" {
  input {
  }

  stack {
    db.query PARTNER_SOCIAL_HA_DATA {
      return = {type: "list"}
      output = ["partner_id", "followers_count"]
    } as $PARTNER_SOCIAL_HA_DATA
  
    var $sum {
      value = {}
    }
  
    foreach ($PARTNER_SOCIAL_HA_DATA) {
      each as $item {
        var $x {
          value = $sum
            |get:$item.partner_id:{}
            |get:"audience_follower_count":0
        }
      
        var.update $sum {
          value = $sum
            |set:$item.partner_id:({}
              |set:"id":$item.partner_id
              |set:"audience_follower_count":($x|add:$item.followers_count)
            )
        }
      }
    }
  
    object.values {
      value = $sum
    } as $to_update
  
    db.bulk.patch PARTNER {
      items = $to_update
    }
  }

  response = null
  tags = ["hype_auditor"]
}
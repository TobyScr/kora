// This functions will find the biggest and smallest number of social media followers for partners.
function "Find min and max of social media followers" {
  input {
  }

  stack {
    var $min {
      value = 0
    }
  
    var $max {
      value = 0
    }
  
    db.query PARTNER {
      return = {
        type: "aggregate"
        eval: {
          max: $db.PARTNER.audience_follower_count|max
          min: $db.PARTNER.audience_follower_count|min
        }
      }
    } as $PARTNER1
  
    conditional {
      if ($PARTNER1.min != null) {
        var.update $min {
          value = $PARTNER1.min
        }
      }
    }
  
    conditional {
      if ($PARTNER1.max != null) {
        var.update $max {
          value = $PARTNER1.max
        }
      }
    }
  }

  response = {min: $min, max: $max}
}
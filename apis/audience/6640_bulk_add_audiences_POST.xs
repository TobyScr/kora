query "bulk-add-audiences" verb=POST {
  api_group = "Audience"
  auth = "USER"

  input {
    text[] audienceName? filters=trim
  }

  stack {
    var $values_to_check {
      value = []
    }
  
    foreach ($input.audienceName) {
      each as $name {
        db.query AUDIENCE {
          where = ($db.AUDIENCE.name|to_lower) == ($name|to_lower)
          return = {type: "list"}
        } as $AUDIENCE3
      
        conditional {
          if ($AUDIENCE3 == null) {
            db.add AUDIENCE {
              data = {created_at: "now", name: $name}
            } as $AUDIENCE2
          
            var.update $values_to_check {
              value = $values_to_check|push:$name
            }
          }
        }
      }
    }
  
    db.query AUDIENCE {
      where = $db.AUDIENCE.name in $values_to_check
      return = {type: "list"}
    } as $AUDIENCE1
  }

  response = $AUDIENCE1
}
query "bulk-add-topic" verb=POST {
  api_group = "Topic"
  auth = "USER"

  input {
    text[] topicNames? filters=trim
  }

  stack {
    var $values_to_check {
      value = []
    }
  
    foreach ($input.topicNames) {
      each as $name {
        db.query TOPIC {
          where = ($db.TOPIC.name|to_lower) == ($name|to_lower)
          return = {type: "list"}
        } as $TOPIC3
      
        conditional {
          if ($TOPIC3 == null) {
            db.add TOPIC {
              data = {created_at: "now", name: $name}
            } as $TOPIC2
          
            var.update $values_to_check {
              value = $values_to_check|push:$name
            }
          }
        }
      }
    }
  
    db.query TOPIC {
      where = $db.TOPIC.name in $values_to_check
      return = {type: "list"}
    } as $TOPIC1
  }

  response = $TOPIC1
}
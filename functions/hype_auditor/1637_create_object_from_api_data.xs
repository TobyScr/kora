// Given a report from HA and the social it belongs to.
// 
// Based on the REQUEST_FIELD_MAPPING table, create an object with the corresponding data.
function "HypeAuditor/Create object from API data" {
  input {
    enum type? {
      values = ["INSTAGRAM", "YOUTUBE", "TIKTOK"]
    }
  
    json response?
  }

  stack {
    var $object {
      value = {}
    }
  
    db.query REQUEST_FIELD_MAPPING {
      where = $db.REQUEST_FIELD_MAPPING.type == $input.type
      return = {type: "list"}
      output = ["from", "to"]
    } as $REQUEST_FIELD_MAPPING
  
    foreach ($REQUEST_FIELD_MAPPING) {
      each as $item {
        var.update $object {
          value = $object
            |set:$item.to:($input.response|get:$item.from:null)
        }
      }
    }
  }

  response = $object
  tags = ["hype_auditor"]
}
// Given a response from a HA report request.
// Create the corresponding entry in the PARTNER_SOCIAL_HA_DATA table with the relevant information.
function "HypeAuditor/Parse report response" {
  input {
    json response?
    enum social_lookout? {
      values = ["INSTAGRAM", "YOUTUBE", "TIKTOK", "INSTAGRAM_ID", "TIKTOK_ID", "X"]
    }
  
    int partner_id {
      table = "PARTNER"
    }
  }

  stack {
    precondition ($input.response.response.status == 200) {
      error = "Request failed"
      payload = $var.response.response
    }
  
    var $report_data {
      value = $input.response
        |get:"response":null
        |get:"result":null
        |get:"result":null
    }
  
    function.run "HypeAuditor/Create object from API data" {
      input = {type: $input.social_lookout, response: $report_data}
    } as $report_obj
  
    var.update $report_obj {
      value = $report_obj
        |set:"partner_id":$input.partner_id
        |set:"social":($input.social_lookout|replace:"_ID":"")
    }
  
    db.query PARTNER_SOCIAL_HA_DATA {
      where = $db.PARTNER_SOCIAL_HA_DATA.partner_id == $report_obj.partner_id && $db.PARTNER_SOCIAL_HA_DATA.social == $report_obj.social
      return = {type: "single"}
      output = ["id"]
    } as $EXISTS
  
    conditional {
      if ($EXISTS != null) {
        db.patch PARTNER_SOCIAL_HA_DATA {
          field_name = "id"
          field_value = $EXISTS.id
          data = $report_obj
        }
      }
    
      else {
        db.bulk.add PARTNER_SOCIAL_HA_DATA {
          allow_id_field = false
          items = []|push:$report_obj
        }
      }
    }
  }

  response = null
  tags = ["hype_auditor"]
}
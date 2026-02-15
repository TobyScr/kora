// Based on the HA_FAILED_REPORTS table.
// Retry asking HA for the corresponding reports.
// 
// In case of success delete the entry from the HA_FAILED_REPORTS  table and create it in the PARTNER_SOCIAL_HA_DATA
// 
// In case of failure again, update the created time and the error messages that appeared
function "HypeAuditor/Retry Failed Reports" {
  input {
  }

  stack {
    // Based on the HA_FAILED_REPORTS table.
    // Retry asking HA for the corresponding reports.
    // 
    // In case of success delete the entry from the HA_FAILED_REPORTS  table and create it in the PARTNER_SOCIAL_HA_DATA
    // 
    // In case of failure again, update the created time and the error messages that appeared
  
    db.query HA_FAILED_REPORTS {
      join = {
        PARTNER_SOCIAL_MEDIA_CHANNEL: {
          table: "PARTNER_SOCIAL_MEDIA_CHANNEL"
          where: $db.HA_FAILED_REPORTS.partner_social_media_channel_id == $db.PARTNER_SOCIAL_MEDIA_CHANNEL.id
        }
      }
    
      eval = {partner_id: $db.PARTNER_SOCIAL_MEDIA_CHANNEL.partner}
      return = {type: "list"}
    } as $HA_FAILED_REPORTS
  
    var $to_update {
      value = []
    }
  
    var $to_delete {
      value = []
    }
  
    foreach ($HA_FAILED_REPORTS) {
      each as $failed_report {
        function.run "HypeAuditor/Request Report" {
          input = {
            partner_id    : $failed_report.partner_id
            social_lookout: $failed_report.social_lookout
            lookup_value  : $failed_report.lookup_value
          }
        } as $response
      
        conditional {
          if ($var.response.response.status == 200) {
            // Handle processing
          
            function.run "HypeAuditor/Parse report response" {
              input = {
                response      : $var.response
                social_lookout: $failed_report.social_lookout
                partner_id    : $failed_report.partner_id
              }
            }
          
            array.push $to_delete {
              value = $failed_report.id
            }
          }
        
          else {
            // Log unsuccessful result
          
            array.push $to_update {
              value = {}
                |set:"id":$failed_report.id
                |set:"created_at":now
                |set:"code":$var.response.response.status
                |set:"ha_code":$var.response.response.result.error.code
                |set:"description":$var.response.response.result.error.description
            }
          }
        }
      }
    }
  
    db.bulk.delete HA_FAILED_REPORTS {
      where = $db.HA_FAILED_REPORTS.id in $to_delete
    }
  
    db.bulk.patch HA_FAILED_REPORTS {
      items = $to_update
    }
  
    function.run "HypeAuditor/Update Followers Count"
  }

  response = {
    records_fixed : $to_delete|count
    records_failed: $to_update|count
  }

  tags = ["hype_auditor"]
}
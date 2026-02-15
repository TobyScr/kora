// This function will update the records of Partner references to other tables to be "deleted".
function "Update deleted Partner references to other tables" {
  input {
    int partner_id
  }

  stack {
    db.get PARTNER {
      field_name = "id"
      field_value = $input.partner_id
    } as $PARTNER_original
  
    precondition ($PARTNER_original != null) {
      error_type = "notfound"
      error = "Partner not found."
    }
  
    function.run "Update deleted Partner Social Media" {
      input = {partner_id: $input.partner_id}
    } as $delete_partner_social_media
  
    function.run "Update deleted Partner Contact" {
      input = {partner_id: $input.partner_id}
    } as $delete_partner_contact
  
    !function.run "" {
      input = {partner_id: $input.partner_id}
    } as $delete_partner_audience
  
    !function.run "" {
      input = {partner_id: $input.partner_id}
    } as $delete_partner_country
  
    !function.run "" {
      input = {partner_id: $input.partner_id}
    } as $delete_partner_entity
  
    !function.run "" {
      input = {partner_id: $input.partner_id}
    } as $delete_partner_language
  
    !function.run "" {
      input = {partner_id: $input.partner_id}
    } as $delete_partner_topic
  }

  response = "Partner references successfully deleted."
}
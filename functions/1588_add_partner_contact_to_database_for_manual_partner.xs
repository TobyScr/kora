// This function will add the partner topic for manual partner of endpoint.
function "Add Partner Contact to database for manual partner" {
  input {
    int partner_id
    text? phone_number? filters=trim
    text? email? filters=trim
  }

  stack {
    conditional {
      if ($input.email != null) {
        db.add PARTNER_CONTACT_DETAIL {
          data = {
            created_at: "now"
            type      : "email"
            value     : $input.email
            partner_id: $input.partner_id
          }
        } as $PARTNER_CONTACT_DETAIL1
      
        db.get PARTNER {
          field_name = "id"
          field_value = $input.partner_id
        } as $PARTNER_original
      
        db.edit PARTNER {
          field_name = "id"
          field_value = $input.partner_id
          data = {
            partner_contact_details: $PARTNER_original.partner_contact_details|push:$PARTNER_CONTACT_DETAIL1.id
          }
        } as $PARTNER1
      }
    }
  
    conditional {
      if ($input.phone_number != null) {
        db.add PARTNER_CONTACT_DETAIL {
          data = {
            created_at: "now"
            type      : "phone_number"
            value     : $input.phone_number
            partner_id: $input.partner_id
          }
        } as $PARTNER_CONTACT_DETAIL1
      
        db.get PARTNER {
          field_name = "id"
          field_value = $input.partner_id
        } as $PARTNER_original
      
        db.edit PARTNER {
          field_name = "id"
          field_value = $input.partner_id
          data = {
            partner_contact_details: $PARTNER_original.partner_contact_details|push:$PARTNER_CONTACT_DETAIL1.id
          }
        } as $PARTNER1
      }
    }
  }

  response = "Partner contact logic finished!"
  tags = ["partner-database"]
}
// This function will add the partner topic from the csv (excel) database
function "Add Partner Contact to database" {
  input {
    int partner_id
    text contacts filters=trim
  }

  stack {
    db.add PARTNER_CONTACT_DETAIL {
      data = {
        created_at: "now"
        type      : "email"
        value     : $input.contacts
      }
    } as $PARTNER_CONTACT_DETAIL1
  
    db.edit PARTNER {
      field_name = "id"
      field_value = $input.partner_id
      data = {
        partner_contact_details: []|push:$PARTNER_CONTACT_DETAIL1.id
      }
    } as $PARTNER1
  }

  response = "Partner contact logic finished!"
  tags = ["partner-database"]
}
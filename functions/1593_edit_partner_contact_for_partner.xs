// This function will edit the partner contact for the partner of endpoint.
function "Edit Partner Contact for partner" {
  input {
    int partner_id?
    text phone_number? filters=trim
    text email? filters=trim
  }

  stack {
    db.get PARTNER {
      field_name = "id"
      field_value = $input.partner_id
    } as $PARTNER_check
  
    db.query PARTNER_CONTACT_DETAIL {
      where = $db.PARTNER_CONTACT_DETAIL.partner_id == $input.partner_id && $db.PARTNER_CONTACT_DETAIL.is_removed == false && $db.PARTNER_CONTACT_DETAIL.type == "phone_number"
      return = {type: "list"}
    } as $PARTNER_CONTACT_DETAIL_phone
  
    conditional {
      if ($PARTNER_CONTACT_DETAIL_phone != null && $input.phone_number != null) {
        db.edit PARTNER_CONTACT_DETAIL {
          field_name = "id"
          field_value = $PARTNER_CONTACT_DETAIL_phone.0.id
          data = {value: $input.phone_number}
        } as $PARTNER_CONTACT_DETAIL2
      }
    }
  
    conditional {
      if ($PARTNER_CONTACT_DETAIL_phone != null && $input.phone_number == null) {
        db.edit PARTNER_CONTACT_DETAIL {
          field_name = "id"
          field_value = $PARTNER_CONTACT_DETAIL_phone.0.id
          data = {is_removed: true}
        } as $PARTNER_CONTACT_DETAIL_edited
      
        db.edit PARTNER {
          field_name = "id"
          field_value = $input.partner_id
          data = {
            partner_contact_details: $PARTNER_check.partner_contact_details|remove:$PARTNER_CONTACT_DETAIL_edited.id:"":true
          }
        } as $PARTNER2
      }
    }
  
    conditional {
      if ($PARTNER_CONTACT_DETAIL_phone == null && $input.phone_number != null) {
        db.add PARTNER_CONTACT_DETAIL {
          data = {
            created_at: "now"
            type      : "phone_number"
            value     : $input.phone_number
            partner_id: $input.partner_id
            is_deleted: false
            is_removed: false
          }
        } as $PARTNER_CONTACT_DETAIL_added
      
        db.get PARTNER {
          field_name = "id"
          field_value = $input.partner_id
        } as $PARTNER3
      
        db.edit PARTNER {
          field_name = "id"
          field_value = $input.partner_id
          data = {
            partner_contact_details: $PARTNER3.partner_contact_details|push:$PARTNER_CONTACT_DETAIL_added.id
          }
        } as $PARTNER1
      }
    }
  
    db.query PARTNER_CONTACT_DETAIL {
      where = $db.PARTNER_CONTACT_DETAIL.partner_id == $input.partner_id && $db.PARTNER_CONTACT_DETAIL.is_removed == false && $db.PARTNER_CONTACT_DETAIL.type == "email"
      return = {type: "list"}
    } as $PARTNER_CONTACT_DETAIL_email
  
    conditional {
      if ($PARTNER_CONTACT_DETAIL_email != null && $input.email != null) {
        db.edit PARTNER_CONTACT_DETAIL {
          field_name = "id"
          field_value = $PARTNER_CONTACT_DETAIL_email.0.id
          data = {value: $input.email}
        } as $PARTNER_CONTACT_DETAIL2
      }
    }
  
    conditional {
      if ($PARTNER_CONTACT_DETAIL_email != null && $input.email == null) {
        db.edit PARTNER_CONTACT_DETAIL {
          field_name = "id"
          field_value = $PARTNER_CONTACT_DETAIL_email.0.id
          data = {is_removed: true}
        } as $PARTNER_CONTACT_DETAIL_edited2
      
        db.get PARTNER {
          field_name = "id"
          field_value = $input.partner_id
        } as $PARTNER5
      
        db.edit PARTNER {
          field_name = "id"
          field_value = $input.partner_id
          data = {
            partner_contact_details: $PARTNER5.partner_contact_details|remove:$PARTNER_CONTACT_DETAIL_edited2.id:"":true
          }
        } as $PARTNER4
      }
    }
  
    conditional {
      if ($PARTNER_CONTACT_DETAIL_email == null && $input.email != null) {
        db.add PARTNER_CONTACT_DETAIL {
          data = {
            created_at: "now"
            type      : "email"
            value     : $input.email
            partner_id: $input.partner_id
            is_deleted: false
            is_removed: false
          }
        } as $PARTNER_CONTACT_DETAIL1
      
        db.get PARTNER {
          field_name = "id"
          field_value = $input.partner_id
        } as $PARTNER6
      
        db.edit PARTNER {
          field_name = "id"
          field_value = $input.partner_id
          data = {
            partner_contact_details: $PARTNER6.partner_contact_details|push:$PARTNER_CONTACT_DETAIL1.id
          }
        } as $PARTNER7
      }
    }
  }

  response = "PARTNER contact logic finished!"
  tags = ["partner-database"]
}
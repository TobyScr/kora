// This endpoint will allow the admin to delete a partner.
query partner verb=DELETE {
  api_group = "Partner"
  auth = "USER"

  input {
    int partner_id
  }

  stack {
    db.get USER {
      field_name = "id"
      field_value = $auth.id
    } as $USER_original
  
    precondition ($USER_original != null) {
      error_type = "notfound"
      error = "User not found."
    }
  
    db.get PARTNER {
      field_name = "id"
      field_value = $input.partner_id
    } as $PARTNER_original
  
    precondition ($PARTNER_original != null) {
      error_type = "notfound"
      error = "Partner not found."
    }
  
    precondition ($PARTNER_original.is_deleted == false) {
      error_type = "badrequest"
      error = "Partner already deleted."
    }
  
    function.run "Update deleted Partner references to other tables" {
      input = {partner_id: $input.partner_id}
    } as $partner_references_deleted
  
    db.edit PARTNER {
      field_name = "id"
      field_value = $input.partner_id
      data = {is_deleted: true, last_updated_at: now}
    } as $PARTNER1
  
    db.add PARTNER_LOGS {
      data = {
        created_at: "now"
        changed_by: $auth.id
        action    : "delete"
        partner_id: $input.partner_id
      }
    } as $PARTNER_LOGS1
  }

  response = "Partner successfully deleted!"
}
// This function will update the "deleted" partner contact records.
function "Update deleted Partner Contact" {
  input {
    int partner_id
  }

  stack {
    db.query PARTNER_CONTACT_DETAIL {
      where = $db.PARTNER_CONTACT_DETAIL.partner_id == $input.partner_id
      return = {type: "list"}
      output = ["id"]
    } as $PARTNER_CONTACT_DETAIL_IDS
  
    foreach ($PARTNER_CONTACT_DETAIL_IDS) {
      each as $item {
        db.edit PARTNER_CONTACT_DETAIL {
          field_name = "id"
          field_value = $item.id
          data = {is_deleted: true}
        } as $PARTNER_CONTACT_DETAIL2
      }
    }
  }

  response = "Partner Contact deleted successfully."
}
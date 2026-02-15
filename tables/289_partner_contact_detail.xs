// This table will contain the list of contacts a partner has.
table PARTNER_CONTACT_DETAIL {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    enum type? {
      values = ["phone_number", "email"]
    }
  
    text value? filters=trim
    int partner_id {
      table = "PARTNER"
    }
  
    // This column will store a boolean value based on the fact whether the Partner has been "deleted" or not.
    bool is_deleted?
  
    // This column will hold a boolean value based on the fact whether the contact is removed during the "edit" of Partner.
    bool is_removed?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  tags = ["partner-contact", "active"]
}
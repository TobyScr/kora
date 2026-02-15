function "Extract phone number and email from Partner contact" {
  input {
    int contact_id?
  }

  stack {
    db.get PARTNER_CONTACT_DETAIL {
      field_name = "id"
      field_value = $input.contact_id
    } as $PARTNER_CONTACT_DETAIL1
  
    var $phone_number {
      value = "/(?<![\\w@])\\+?\\d[\\d\\s\\-()]*(?:\\([\\d\\s,]+\\))?/"
        |regex_get_all_matches:$PARTNER_CONTACT_DETAIL1.value
    }
  
    var $email {
      value = "/[\\w\\.-]+@[\\w\\.-]+\\.\\w+/"
        |regex_get_all_matches:$PARTNER_CONTACT_DETAIL1.value
    }
  
    var $single_phone_number {
      value = ""
    }
  
    var $single_email {
      value = ""
    }
  
    foreach ($phone_number.0) {
      each as $item {
        conditional {
          if ($single_phone_number == null) {
            var.update $single_phone_number {
              value = $item
            }
          }
        
          else {
            var.update $single_phone_number {
              value = $single_phone_number|concat:$item:";"
            }
          }
        }
      }
    }
  
    foreach ($email.0) {
      each as $item {
        conditional {
          if ($single_email == null) {
            var.update $single_email {
              value = $item
            }
          }
        
          else {
            var.update $single_email {
              value = $single_email|concat:$item:";"
            }
          }
        }
      }
    }
  }

  response = {phone_number: $single_phone_number, email: $single_email}
}
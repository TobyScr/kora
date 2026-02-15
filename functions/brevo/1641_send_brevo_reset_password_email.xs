// This function will send a basic email
function "Brevo/Send Brevo reset password email" {
  input {
    email to_email? filters=trim|lower
    text magic_link filters=trim
  }

  stack {
    var $sender {
      value = {}
        |set:"name":"Project Kora"
        |set:"email":$env.brevo_from_email
    }
  
    var $destinatary {
      value = []
        |push:({}|set:"email":$input.to_email)
    }
  
    var $subject {
      value = "Password Reset"
    }
  
    var $content {
      value = '<html><body><p>Hi there!</p><p>Click the link below to reset your password:</p><p><a href="MAGIC_LINK">Click here</a></p></body></html>'
        |replace:"MAGIC_LINK":$input.magic_link
    }
  
    api.request {
      url = "https://api.brevo.com/v3/smtp/email"
      method = "POST"
      params = {}
        |set:"sender":$sender
        |set:"to":$destinatary
        |set:"subject":$subject
        |set:"htmlContent":$content
      headers = []
        |push:"accept: application/json"
        |push:("api-key:"|concat:$env.brevo_api_key:"")
        |push:"content-type: application/json"
    } as $api1
  }

  response = $api1
  tags = ["email"]
}
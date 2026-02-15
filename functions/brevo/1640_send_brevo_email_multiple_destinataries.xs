// This function will send a basic email to multiple destinataries
function "Brevo/Send Brevo email multiple destinataries" {
  input {
    email[] to_email? filters=trim|lower
    text subject? filters=trim
    text content? filters=trim
  }

  stack {
    var $sender {
      value = {}
        |set:"name":"Project Kora"
        |set:"email":$env.brevo_from_email
    }
  
    var $destinatary {
      value = []
    }
  
    foreach ($input.to_email) {
      each as $email {
        array.push $destinatary {
          value = {}|set:"email":$email
        }
      }
    }
  
    api.request {
      url = "https://api.brevo.com/v3/smtp/email"
      method = "POST"
      params = {}
        |set:"sender":$sender
        |set:"to":$destinatary
        |set:"subject":$input.subject
        |set:"htmlContent":$input.content
      headers = []
        |push:"accept: application/json"
        |push:("api-key:"|concat:$env.brevo_api_key:"")
        |push:"content-type: application/json"
    } as $api1
  }

  response = $api1
  tags = ["email"]
}
// This function will send the initial signup email invite.
function "Brevo/Send Brevo signup email" {
  input {
    text name? filters=trim
    text email? filters=trim
    text magic_link? filters=trim
  }

  stack {
    api.request {
      url = "https://api.brevo.com/v3/smtp/email"
      method = "POST"
      params = {}
        |set:"sender":({}
          |set:"name":"Project Kora"
          |set:"email":$env.brevo_from_email
        )
        |set:"to":([]
          |push:({}
            |set:"email":$input.email
            |set:"name":$input.name
          )
        )
        |set:"subject":"Project Kora invite"
        |set:"htmlContent":('<html><body><p>Hello %s,</p><p>An account has been created on your behalf for Project Kora.</p><p>Click the link below to reset your password:</p><p><a href="%s">Click here</a></p><p>This link will expire within a day.</p></body></html>'
          |sprintf:$input.name:$input.magic_link
        )
      headers = []
        |push:"accept: application/json"
        |push:("api-key:"|concat:$env.brevo_api_key:"")
        |push:"content-type: application/json"
    } as $api1
  }

  response = $api1
  tags = ["email"]
}
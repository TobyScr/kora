// Endpoint for requesting magic link
query "auth/magic-link" verb=GET {
  api_group = "Magic Link"

  input {
    email email?
  }

  stack {
    function.run generate_magic_link {
      input = {email: $input.email}
    } as $magic_link
  
    precondition ($magic_link != null) {
      error = "Magic link could not be created. Try again."
    }
  
    function.run "Brevo/Send Brevo reset password email" {
      input = {to_email: $input.email, magic_link: $magic_link}
    } as $func1
  }

  response = {
    message: {}|set:"success":true|set:"message":"magic link sent"
  }
}
function "New user logic" {
  input {
    email email?
    text name filters=trim
  }

  stack {
    function.run generate_magic_link_for_new_user {
      input = {email: $input.email}
    } as $magic_link
  
    precondition ($magic_link != null) {
      error = "Magic link could not be created. Try again."
    }
  
    function.run "Brevo/Send Brevo signup email" {
      input = {
        name      : $input.name
        email     : $input.email
        magic_link: $magic_link
      }
    } as $brevo_email
  }

  response = {
    message: {}|set:"success":true|set:"message":"magic link sent"
  }
}
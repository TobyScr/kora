// Given a list of emails, invite the users to the client
query "client/{client_id}/invite" verb=POST {
  api_group = "Client"
  auth = "USER"

  input {
    int client_id {
      table = "CLIENT"
    }
  
    // List of users users to invite to the client
    object[] user_info? {
      schema {
        email email? filters=trim|lower
        int role_id? {
          table = "ROLE"
        }
      }
    }
  }

  stack {
    db.get CLIENT {
      field_name = "id"
      field_value = $input.client_id
      output = ["name"]
    } as $CLIENT
  
    var $role_id_list {
      value = $input.user_info
        |get:"role_id":null
        |safe_array
        |filter_empty:""
        |unique:""
    }
  
    db.query ROLE {
      where = $db.ROLE.id in $role_id_list
      return = {type: "list"}
      output = ["id"]
    } as $found_ids|get:"id":[]
  
    precondition ($CLIENT != null) {
      error_type = "notfound"
      error = "Client not found."
    }
  
    precondition ($found_ids|count|equals:($role_id_list|count)) {
      error_type = "notfound"
      error = "Some roles were not found"
    }
  
    foreach ($input.user_info) {
      each as $item {
        db.get USER {
          field_name = "email"
          field_value = $item.email
          output = ["id"]
        } as $EXISTING_USER
      
        conditional {
          if ($EXISTING_USER != null) {
            var $user_id {
              value = $EXISTING_USER|get:"id":null
            }
          }
        
          else {
            db.add USER {
              data = {
                created_at: "now"
                email     : $item.email
                role_id   : $item.role_id
                is_deleted: false
              }
            
              output = ["id"]
            } as $user_id|get:"id":null
          }
        }
      
        db.query USER_CLIENT {
          where = $db.USER_CLIENT.client_id == $input.client_id && $db.USER_CLIENT.user_id == $user_id
          return = {type: "exists"}
        } as $EXISTS
      
        conditional {
          if ($EXISTS == false) {
            db.add USER_CLIENT {
              data = {
                client_id: $input.client_id
                user_id  : $user_id
                role_id  : $item.role_id
              }
            }
          }
        }
      
        function.run generate_magic_link {
          input = {email: $item.email}
        } as $magic_link
      
        conditional {
          if ($EXISTING_USER != null) {
            conditional {
              if ($env.$datasource == "dev") {
                var.update $magic_link {
                  value = "https://project-kora.bubbleapps.io/version-test"
                }
              }
            
              else {
                var.update $magic_link {
                  value = "https://project-kora.bubbleapps.io"
                }
              }
            }
          
            var $email_body {
              value = """
                <p>Hello,</p>
                
                <p>You’ve been invited to join the NAME_TO_REPLACE workspace.</p>
                
                <p>
                  <a href="URL_TO_REPLACE">Go to the homepage to check it out</a>
                </p>
                """
                |replace:"URL_TO_REPLACE":$magic_link
                |replace:"NAME_TO_REPLACE":$CLIENT.name
            }
          }
        
          else {
            var $email_body {
              value = """
                <p>Hello,</p>
                
                <p>You’ve been invited to join the NAME_TO_REPLACE workspace.</p>
                
                <p>
                  <a href="URL_TO_REPLACE">Click here to join</a>
                </p>
                
                <p>If you weren’t expecting this invite, feel free to ignore this email.</p>
                """
                |replace:"URL_TO_REPLACE":$magic_link
                |replace:"NAME_TO_REPLACE":$CLIENT.name
            }
          }
        }
      
        function.run "Brevo/Send Brevo email" {
          input = {
            to_email: $item.email
            subject : "Workspace Invitation"
            content : $email_body
          }
        } as $func1
      }
    }
  }

  response = $func1
}
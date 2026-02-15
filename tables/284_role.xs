// This table will contain all the available user roles for the app.
table ROLE {
  auth = false

  schema {
    int id
  
    // This column contains the name of the role.
    text name filters=trim
  
    // This column is an enum of roles of the app.
    enum role {
      values = ["admin", "user", "editor"]
    }
  }

  index = [{type: "primary", field: [{name: "id"}]}]
  tags = ["roles"]
}
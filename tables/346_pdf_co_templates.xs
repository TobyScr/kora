table PDF_CO_TEMPLATES {
  auth = false

  schema {
    int id
    text title? filters=trim
    int template_id?
  }

  index = [{type: "primary", field: [{name: "id"}]}]
  tags = ["active"]
}
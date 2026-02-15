function "PDFco/Request PDF from Template" {
  input {
    text template_name? filters=trim
    json data?
    text name? filters=trim
    text footer? filters=trim
  }

  stack {
    db.get PDF_CO_TEMPLATES {
      field_name = "title"
      field_value = $input.template_name
    } as $template_id|get:"template_id":null
  
    precondition ($template_id != null) {
      error_type = "notfound"
      error = "Template not found"
    }
  
    var $URL {
      value = $env.pdf_co_url
        |concat:"/pdf/convert/from/html":""
    }
  
    var $HEADERS {
      value = []
        |push:"Content-Type: application/json"
        |push:("x-api-key: "|concat:$env.pdf_co_api_key:"")
    }
  
    var $BODY {
      value = """
        {
            "paperSize": "A4",
            "orientation": "Portrait",
            "printBackground": true,
            "mediaType": "print", 
            "margins":"60px 50px 50px 50px",
            "header": "",
            "async": false
        }
        """
        |json_decode
        |set:"templateId":$template_id
        |set:"name":$input.name
        |set:"footer":$input.footer
        |set:"templateData":($input.data|json_encode)
    }
  
    api.request {
      url = $URL
      method = "POST"
      params = $BODY
      headers = $HEADERS
      timeout = 20
    } as $response
  }

  response = $var.response.response
}
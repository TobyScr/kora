query "pdf/template/sync" verb=GET {
  api_group = "PDF.co"
  auth = "USER"

  input {
  }

  stack {
    var $URL {
      value = $env.pdf_co_url|concat:"/templates/html":""
    }
  
    var $HEADERS {
      value = []
        |push:"Content-Type: application/json"
        |push:("x-api-key: "|concat:$env.pdf_co_api_key:"")
    }
  
    api.request {
      url = $URL
      method = "GET"
      headers = $HEADERS
    } as $result
  
    precondition ($result.response.status == 200)
    db.bulk.delete PDF_CO_TEMPLATES {
      where = $db.PDF_CO_TEMPLATES.id != null
    }
  
    var $to_create {
      value = []
    }
  
    foreach ($result.response.result.templates) {
      each as $item {
        array.push $to_create {
          value = {}
            |set:"title":$item.title
            |set:"template_id":$item.id
        }
      }
    }
  
    db.bulk.add PDF_CO_TEMPLATES {
      allow_id_field = false
      items = $to_create
    } as $PDF_CO_TEMPLATES
  }

  response = null
}
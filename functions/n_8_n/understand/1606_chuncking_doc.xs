function "n8n/understand/chuncking_doc" {
  input {
    text file_id? filters=trim
    int intervention_id?
  }

  stack {
    db.query RESEARCH_Files_ {
      where = $db.RESEARCH_Files.id == $input.file_id
      return = {type: "single"}
    } as $research_file
  
    storage.sign_private_url {
      pathname = $research_file.file.path
      ttl = 3600
    } as $file_url
  
    !storage.create_file_resource {
      filename = $research_file.file.name
      filedata = $file_url
    } as $file_resource
  
    !storage.read_file_resource {
      value = $file_resource
    } as $file
  
    !util.set_header {
      value = "Content-Type: application/pdf"
      duplicates = "replace"
    }
  
    !util.set_header {
      value = 'Content-Disposition: attachment; filename="FILE_NAME"'
        |replace:"FILE_NAME":$research_file.file.name
      duplicates = "replace"
    }
  
    var $params {
      value = {}
        |set:"file_id":$input.file_id
        |set:"file_name":$research_file.file.name
        |set:"intervention_id":$input.intervention_id
        |set:"data_source":$env.$datasource
        |set:"file":$file_url
    }
  
    api.request {
      url = "/webhook/chunk_document"
      method = "POST"
      params = $params
      headers = []
        |push:"Content-Type: application/json"
    } as $api
  }

  response = $api
}
query "research-upload-file" verb=POST {
  api_group = "Research"
  auth = "USER"

  input {
    file? file?
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    enum subsection? {
      values = ["proprietary", "external", "deep"]
    }
  
    int research_sections_id? {
      table = "RESEARCH_SECTIONS"
    }
  }

  stack {
    function.run "apiKey/validate" {
      input = {
        public: $env.$http_headers["X-Client"]
        secret: $env.$http_headers["X-Secret"]
      }
    } as $func1
  
    db.get INTERVENTION {
      field_name = "id"
      field_value = $input.intervention_id
    } as $INTERVENTION1
  
    precondition ($INTERVENTION1 != null) {
      error_type = "notfound"
    }
  
    storage.create_attachment {
      value = $input.file
      access = "private"
      filename = ""
    } as $file_created
  
    db.query RESEARCH_Files_ {
      where = $db.RESEARCH_Files.file.name == $file_created.name && $db.RESEARCH_Files.intervention_id == $input.intervention_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS == false) {
      error_type = "badrequest"
      error = "A file with the same name already exists"
    }
  
    db.add RESEARCH_Files_ {
      data = {
        created_at     : "now"
        intervention_id: $input.intervention_id
        status         : "pending"
        type           : "file"
        subsection     : $input.subsection
        value          : {}
        section_id     : $input.research_sections_id
        file           : $file_created
      }
    } as $RESEARCH_Files1
  
    storage.sign_private_url {
      pathname = $RESEARCH_Files1.file.path
      ttl = 3600
    } as $signed_url
  
    function.run "n8n/understand/chuncking_doc" {
      input = {
        file_id        : $RESEARCH_Files1.id
        file_url       : $signed_url
        file_name      : $RESEARCH_Files1.file.name
        intervention_id: $input.intervention_id
      }
    } as $func1
  }

  response = $RESEARCH_Files1
}
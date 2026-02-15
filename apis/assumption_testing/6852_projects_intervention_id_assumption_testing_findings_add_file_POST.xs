// Adds a file in the RESEARCH_Files_ table for the Assumption Testing section
query "projects/{intervention_id}/assumption-testing/findings/add-file" verb=POST {
  api_group = "Assumption Testing"
  auth = "USER"

  input {
    file? file?
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    } as $func2
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Assumption Testing"
      }
    } as $func3
  
    storage.create_attachment {
      value = $input.file
      access = "private"
      filename = ""
    } as $file_created
  
    // Check that a file with the same name in the same intervention doesnt exists already
  
    db.query RESEARCH_Files_ {
      where = $db.RESEARCH_Files.file.name == $file_created.name && $db.RESEARCH_Files.intervention_id == $input.intervention_id && $db.RESEARCH_Files.subsection == "findings"
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
        subsection     : "findings"
        file           : $file_created
      }
    
      output = [
        "id"
        "created_at"
        "intervention_id"
        "status"
        "type"
        "subsection"
        "value"
        "txt_value"
        "file.access"
        "file.path"
        "file.name"
        "file.type"
        "file.size"
        "file.mime"
        "file.meta"
        "file.url"
      ]
    } as $RESEARCH_Files1
  
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
  tags = ["v2", "assumption_finding"]
}
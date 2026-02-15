// Adds a file in the RESEARCH_Files_ table for the DeepResearch section
query "projects/research/deep-research/add-file" verb=POST {
  api_group = "Research"
  auth = "USER"

  input {
    file? file?
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    int research_sections_id? {
      table = "RESEARCH_SECTIONS"
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    } as $func2
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Research Insights"
      }
    } as $func3
  
    db.query RESEARCH_SECTIONS {
      where = $db.RESEARCH_SECTIONS.id == $input.research_sections_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Related Entity not found."
    }
  
    storage.create_attachment {
      value = $input.file
      access = "private"
      filename = ""
    } as $file_created
  
    // Check that a file with the same name in the same intervention doesnt exists already
  
    db.query RESEARCH_Files_ {
      where = $db.RESEARCH_Files.file.name == $file_created.name && $db.RESEARCH_Files.intervention_id == $input.intervention_id && $db.RESEARCH_Files.subsection == "deep"
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
        subsection     : "deep"
        section_id     : $input.research_sections_id
        file           : $file_created
      }
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
  tags = ["v2", "deep_research"]
}
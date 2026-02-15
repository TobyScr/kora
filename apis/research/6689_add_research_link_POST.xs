query add_research_link verb=POST {
  api_group = "Research"
  auth = "USER"

  input {
    int intervention_id?
    enum subsection? {
      values = ["proprietary", "external", "deep"]
    }
  
    int research_sections_id?
    text url? filters=trim
  }

  stack {
    db.get INTERVENTION {
      field_name = "id"
      field_value = $input.intervention_id
    } as $INTERVENTION1
  
    precondition ($INTERVENTION1 != null) {
      error_type = "notfound"
    }
  
    db.add RESEARCH_Files_ {
      data = {
        created_at     : "now"
        intervention_id: $input.intervention_id
        status         : "pending"
        type           : "url"
        subsection     : $input.subsection
        section_id     : $input.research_sections_id
        txt_value      : $input.url
      }
    } as $RESEARCH_Files1
  
    function.run "n8n/scraping" {
      input = {
        file_id        : $RESEARCH_Files1.id
        file_url       : $RESEARCH_Files1.txt_value
        file_name      : $RESEARCH_Files1.txt_value
        intervention_id: $INTERVENTION1.id
      }
    } as $func1
  }

  response = $RESEARCH_Files1
}
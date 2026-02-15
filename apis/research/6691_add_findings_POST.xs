query add_findings verb=POST {
  api_group = "Research"
  auth = "USER"

  input {
    int intervention_id?
    enum subsection? {
      values = ["proprietary", "external", "deep"]
    }
  
    int research_sections_id?
    text findings? filters=trim
    uuid? research_file_id?
  }

  stack {
    db.get INTERVENTION {
      field_name = "id"
      field_value = $input.intervention_id
    } as $INTERVENTION1
  
    precondition ($INTERVENTION1 != null)
    conditional {
      if ($input.research_file_id == null) {
        db.add RESEARCH_Files_ {
          data = {
            created_at     : "now"
            intervention_id: $input.intervention_id
            status         : "pending"
            type           : "findings"
            subsection     : $input.subsection
            section_id     : $input.research_sections_id
            txt_value      : $input.findings
          }
        } as $RESEARCH_Files1
      }
    
      else {
        db.edit RESEARCH_Files_ {
          field_name = "id"
          field_value = $input.research_file_id
          data = {txt_value: $input.findings}
        } as $RESEARCH_Files2
      }
    }
  }

  response = "updated"
}
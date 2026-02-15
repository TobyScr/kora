query intervention_research_records verb=POST {
  api_group = "Research"
  auth = "USER"

  input {
    dblink {
      table = "RESEARCH"
      override = {
        content                   : {hidden: true}
        files_urls                : {hidden: true}
        is_skipped                : {hidden: true}
        is_confirmed              : {hidden: true}
        proprietary_links         : {hidden: true}
        research_files_id         : {hidden: true}
        proprietary_findings      : {hidden: true}
        research_sections_id      : {hidden: true}
        proprietary_uploaded_files: {hidden: true}
      }
    }
  }

  stack {
    db.query RESEARCH {
      where = $db.RESEARCH.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $RESEARCH1
  
    db.query RESEARCH_SECTIONS {
      return = {type: "list"}
    } as $RESEARCH_SECTIONS1
  
    conditional {
      if (($RESEARCH1|count) == 0) {
        foreach ($RESEARCH_SECTIONS1) {
          each as $item {
            db.add RESEARCH {
              data = {
                created_at                : "now"
                intervention_id           : $input.intervention_id
                content                   : null
                proprietary_findings      : null
                proprietary_links         : null
                is_confirmed              : false
                research_sections_id      : $item.id
                is_skipped                : false
                proprietary_uploaded_files: null
              }
            } as $RESEARCH2
          }
        }
      }
    
      else {
        throw {
          name = "records_exist"
          value = "records already exist"
        }
      }
    }
  }

  response = $model
}
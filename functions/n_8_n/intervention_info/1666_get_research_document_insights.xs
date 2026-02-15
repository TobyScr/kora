function "n8n/Intervention Info/Get Research Document Insights" {
  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    json intervention_info
  }

  stack {
    var $info {
      value = $input.intervention_info
    }
  
    !conditional {
      if ($input.confirmed_steps|in:"Research Insights") {
        db.query RESEARCH_Files_ {
          where = $db.RESEARCH_Files.intervention_id == $input.intervention_id && $db.RESEARCH_Files.type == "findings" && $db.RESEARCH_Files.subsection == "existing"
          return = {type: "list"}
          output = ["txt_value"]
        } as $EXISTING_RESEARCH_FINDINGS|get:"txt_value":null|safe_array|filter_empty:""
      
        var.update $info {
          value = $info
            |set:"EXISTING_RESEARCH_FINDINGS":$EXISTING_RESEARCH_FINDINGS
        }
      
        db.query RESEARCH_INSIGHTS {
          where = $db.RESEARCH_INSIGHTS.intervention_id == $input.intervention_id
          return = {type: "list"}
        } as $RESEARCH_INSIGHTS
      
        var.update $info {
          value = $info
            |set:"RESEARCH_INSIGHTS":$RESEARCH_INSIGHTS
        }
      }
    }
  
    db.query RESEARCH_Files_ {
      where = $db.RESEARCH_Files.intervention_id == $input.intervention_id && $db.RESEARCH_Files.type == "file"
      return = {type: "list"}
    } as $RESEARCH_FILES
  
    var.update $info {
      value = $info
        |set:"RESEARCH_FILES":$RESEARCH_FILES
    }
  
    db.query RESEARCH_Files_ {
      where = $db.RESEARCH_Files.intervention_id == $input.intervention_id && $db.RESEARCH_Files.type == "url" && $db.RESEARCH_Files.subsection == "existing"
      return = {type: "list"}
      output = ["txt_value"]
    } as $RESEARCH_URLS|get:"txt_value":null|safe_array|filter_empty:""
  
    var.update $info {
      value = $info
        |set:"EXISTING_RESEARCH_URLS":$RESEARCH_URLS
    }
  
    db.query DOCUMENT_INSIGHT {
      where = $db.DOCUMENT_INSIGHT.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $DOCUMENT_INSIGHTS
  
    var.update $info {
      value = $info
        |set:"DOCUMENT_INSIGHTS":$DOCUMENT_INSIGHTS
    }
  }

  response = $info
}
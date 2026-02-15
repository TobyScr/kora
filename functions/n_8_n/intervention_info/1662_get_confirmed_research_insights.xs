function "n8n/Intervention Info/Get confirmed Research Insights" {
  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    json intervention_info
    text[] confirmed_steps
  }

  stack {
    var $info {
      value = $input.intervention_info
    }
  
    conditional {
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
      
        db.query RESEARCH_Files_ {
          where = $db.RESEARCH_Files.intervention_id == $input.intervention_id && $db.RESEARCH_Files.type == "url" && $db.RESEARCH_Files.subsection == "existing"
          return = {type: "list"}
          output = ["txt_value"]
        } as $EXISTING_RESEARCH_URLS|get:"txt_value":null|safe_array|filter_empty:""
      
        var.update $info {
          value = $info
            |set:"EXISTING_RESEARCH_URLS":$EXISTING_RESEARCH_URLS
        }
      
        db.query RESEARCH_INSIGHTS {
          where = $db.RESEARCH_INSIGHTS.intervention_id == $input.intervention_id
          return = {type: "list"}
          output = ["insight", "description", "source"]
        } as $RESEARCH_INSIGHTS
      
        var.update $info {
          value = $info
            |set:"RESEARCH_INSIGHTS":$RESEARCH_INSIGHTS
        }
      }
    }
  }

  response = $info
}
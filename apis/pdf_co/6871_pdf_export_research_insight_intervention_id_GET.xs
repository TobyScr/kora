query "pdf/export/research-insight/{intervention_id}" verb=GET {
  api_group = "PDF.co"
  auth = "USER"

  input {
    int intervention_id?=508 {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query RESEARCH_INSIGHTS {
      where = $db.RESEARCH_INSIGHTS.intervention_id == $input.intervention_id
      return = {type: "list"}
      output = ["insight", "description", "source"]
    } as $RESEARCH_INSIGHTS
  
    db.query INTERVENTION {
      join = {
        PROJECT: {
          table: "PROJECT"
          where: $db.INTERVENTION.project_id == $db.PROJECT.id
        }
      }
    
      where = $db.INTERVENTION.id == $input.intervention_id
      eval = {
        project_name     : $db.PROJECT.name
        intervention_name: $db.intervention.name
      }
    
      return = {type: "single"}
      output = ["project_name", "intervention_name"]
    } as $INTERVENTION
  
    precondition (($RESEARCH_INSIGHTS|is_empty) == false && ($INTERVENTION|is_empty) == false) {
      error_type = "notfound"
      error = "Entities not found."
    }
  
    var $INSIGHTS {
      value = $INTERVENTION
        |set:"generated_date":(now|format_timestamp:"d M Y":"UTC")
        |set:"insights":$RESEARCH_INSIGHTS
    }
  
    var $FILE_NAME {
      value = "ResearchInsights_ProjectName_InterventionName_Date.pdf"
        |replace:"ProjectName":$INSIGHTS.project_name
        |replace:"InterventionName":$INSIGHTS.intervention_name
        |replace:"Date":$INSIGHTS.generated_date
    }
  
    var $FOOTER {
      value = "<div class='preserveHtml' style='width:100%; padding:0px 80px 10px 80px; display: flex;justify-content: space-between;align-items: center;color: #B6BFC9;font-weight: 400;font-style: Regular;font-size: 8px;line-height: 150%;letter-spacing: 0%;'><span>project_name / intervention_name</span><span>&lt;<span class='pageNumber'></span>&gt;</span></div>"
        |replace:"project_name":$INSIGHTS.project_name
        |replace:"intervention_name":$INSIGHTS.intervention_name
    }
  
    function.run "PDFco/Request PDF from Template" {
      input = {
        template_name: "Research Insights Export"
        data         : $INSIGHTS
        name         : $FILE_NAME
        footer       : $FOOTER
      }
    } as $response
  
    precondition ($var.response.result.status == 200) {
      payload = '""'
    }
  
    storage.create_file_resource {
      filename = $FILE_NAME
      filedata = $var.response.result.url
    } as $file_resource
  
    storage.read_file_resource {
      value = $file_resource
    } as $file
  
    util.set_header {
      value = "Content-Type: application/pdf"
      duplicates = "replace"
    }
  
    util.set_header {
      value = 'Content-Disposition: attachment; filename="FILE_NAME"'|replace:"FILE_NAME":$FILE_NAME
      duplicates = "replace"
    }
  }

  response = $file.data
}
query "pdf/export/brief/{intervention_id}" verb=GET {
  api_group = "PDF.co"
  auth = "USER"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query BRIEF_OUTPUT {
      join = {
        INTERVENTION: {
          table: "INTERVENTION"
          where: $db.BRIEF_OUTPUT.intervention_id == $db.INTERVENTION.id
        }
        PROJECT     : {
          table: "PROJECT"
          where: $db.INTERVENTION.project_id == $db.PROJECT.id
        }
      }
    
      where = $db.BRIEF_OUTPUT.intervention_id == $input.intervention_id
      eval = {
        intervention_name: $db.INTERVENTION.name
        project_name     : $db.PROJECT.name
        project_date     : $db.PROJECT.created_at
      }
    
      return = {type: "single"}
      output = [
        "client"
        "location"
        "budget_currency"
        "budget_min"
        "budget_max"
        "timeline_unit"
        "timeline_min"
        "timeline_max"
        "problem_definition"
        "high_level_objective"
        "expected_deliverables"
        "ta_profile"
        "dos"
        "donts"
        "intervention_name"
        "project_name"
        "project_date"
      ]
    } as $BRIEF
  
    precondition ($BRIEF != null) {
      error_type = "notfound"
      error = "Brief not found."
    }
  
    var.update $BRIEF {
      value = $BRIEF
        |set:"generated_date":(now|format_timestamp:"d M Y":"UTC")
    }
  
    var $FILE_NAME {
      value = "Brief_ProjectName_InterventionName_Date.pdf"
        |replace:"ProjectName":$BRIEF.project_name
        |replace:"InterventionName":$BRIEF.intervention_name
        |replace:"Date":$BRIEF.generated_date
    }
  
    var $FOOTER {
      value = "<div class='preserveHtml' style='width:100%; padding:0px 80px 10px 80px; display: flex;justify-content: space-between;align-items: center;color: #B6BFC9;font-weight: 400;font-style: Regular;font-size: 8px;line-height: 150%;letter-spacing: 0%;'><span>project_name / intervention_name</span><span>&lt;<span class='pageNumber'></span>&gt;</span></div>"
        |replace:"project_name":$BRIEF.project_name
        |replace:"intervention_name":$BRIEF.intervention_name
    }
  
    function.run "Utils/Remove dash from text start" {
      input = {obj: $BRIEF}
    } as $BRIEF
  
    function.run "Utils/Remove dash from text start" {
      input = {obj: $BRIEF}
    } as $BRIEF
  
    function.run "Utils/Remove dash from text start" {
      input = {obj: $BRIEF}
    } as $BRIEF
  
    function.run "PDFco/Request PDF from Template" {
      input = {
        template_name: "Brief Export"
        data         : $BRIEF
        name         : $FILE_NAME
        footer       : $FOOTER
      }
    } as $response
  
    precondition ($var.response.status == 200) {
      payload = $var.response
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
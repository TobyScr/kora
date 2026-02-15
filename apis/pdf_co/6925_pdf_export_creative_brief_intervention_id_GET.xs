query "pdf/export/creative-brief/{intervention_id}" verb=GET {
  api_group = "PDF.co"
  auth = "USER"

  input {
    int intervention_id?=508 {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query CBD_INTRODUCTION {
      where = $db.CBD_INTRODUCTION.intervention_id == $input.intervention_id
      return = {type: "single"}
      output = ["summary", "context", "problem", "objectives"]
    } as $CBD_INTRODUCTION
  
    db.query CBD_AUDIENCE {
      where = $db.CBD_AUDIENCE.intervention_id == $input.intervention_id
      return = {type: "single"}
      output = ["target_profile", "barriers", "strategy"]
    } as $CBD_AUDIENCE
  
    db.query CBD_BRIEF {
      where = $db.CBD_BRIEF.intervention_id == $input.intervention_id
      return = {type: "single"}
      output = [
        "territory"
        "cta"
        "smp"
        "key_messages"
        "tfd_shift"
        "deliverables"
        "timings"
        "mandatories"
        "budget"
        "inspiration"
      ]
    } as $CBD_BRIEF
  
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
  
    precondition (($CBD_INTRODUCTION|is_empty) == false && ($INTERVENTION|is_empty) == false && ($CBD_AUDIENCE|is_empty) == false && ($CBD_BRIEF|is_empty) == false) {
      error_type = "notfound"
      error = "Entities not found."
    }
  
    var $INFORMATION {
      value = $INTERVENTION
        |set:"generated_date":(now|format_timestamp:"d M Y":"UTC")
        |set:"information":$CBD_INTRODUCTION
        |set:"audience":$CBD_AUDIENCE
        |set:"brief":$CBD_BRIEF
    }
  
    var $FILE_NAME {
      value = "CreativeBrief_ProjectName_InterventionName_Date.pdf"
        |replace:"ProjectName":$INFORMATION.project_name
        |replace:"InterventionName":$INFORMATION.intervention_name
        |replace:"Date":$INFORMATION.generated_date
    }
  
    var $FOOTER {
      value = "<div class='preserveHtml' style='width:100%; padding:0px 80px 10px 80px; display: flex;justify-content: space-between;align-items: center;color: #B6BFC9;font-weight: 400;font-style: Regular;font-size: 8px;line-height: 150%;letter-spacing: 0%;'><span>project_name / intervention_name</span><span>&lt;<span class='pageNumber'></span>&gt;</span></div>"
        |replace:"project_name":$INFORMATION.project_name
        |replace:"intervention_name":$INFORMATION.intervention_name
    }
  
    function.run "PDFco/Request PDF from Template" {
      input = {
        template_name: "Creative Brief Export"
        data         : $INFORMATION
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
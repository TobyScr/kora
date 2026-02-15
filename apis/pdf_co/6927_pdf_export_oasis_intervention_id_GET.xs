query "pdf/export/oasis/{intervention_id}" verb=GET {
  api_group = "PDF.co"
  auth = "USER"

  input {
    int intervention_id?=508 {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query OASIS {
      where = $db.OASIS.intervention_id == $input.intervention_id
      return = {type: "single"}
    } as $OASIS
  
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
  
    precondition (($INTERVENTION|is_empty) == false && ($OASIS|is_empty) == false) {
      error_type = "notfound"
      error = "Entities not found."
    }
  
    var $INFORMATION {
      value = $INTERVENTION
        |set:"generated_date":(now|format_timestamp:"d M Y":"UTC")
        |set:"background":$OASIS.core_challenge
        |set:"objective":({}
          |set:"outcome":$OASIS.outcome
          |set:"campaign_objectives":$OASIS.campaign_objectives
        )
        |set:"audience":({}
          |set:"demographics":$OASIS.demographics
          |set:"attitudes_behaviors":$OASIS.attitudes_behaviors
          |set:"barriers":$OASIS.barriers
        )
        |set:"strategy":({}
          |set:"selected_strategy":$OASIS.selected_strategy
          |set:"key_messages":$OASIS.key_messages
          |set:"core_cta":$OASIS.core_cta
        )
        |set:"implementation":({}
          |set:"creative_territory":$OASIS.creative_territory
          |set:"user_journey":$OASIS.user_journey
          |set:"timings":$OASIS.timings
        )
        |set:"scoring":$OASIS.metrics
    }
  
    var $FILE_NAME {
      value = "OASISPlan_ProjectName_InterventionName_Date.pdf"
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
        template_name: "OASIS Plan Export"
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
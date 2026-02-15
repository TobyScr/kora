function "n8n/Intervention Info/Get confirmed Assumption Testing" {
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
      if ($input.confirmed_steps|in:"Assumption Testing") {
        db.query ASSUMPTION {
          where = $db.ASSUMPTION.intervention_id == $input.intervention_id
          return = {type: "list"}
          output = ["assumption"]
        } as $ASSUMPTION|get:"assumption":null
      
        var.update $info {
          value = $info|set:"ASSUMPTION":$ASSUMPTION
        }
      
        db.query RESEARCH_QUESTION {
          where = $db.RESEARCH_QUESTION.intervention_id == $input.intervention_id
          return = {type: "list"}
        } as $RESEARCH_QUESTION|get:"question":null
      
        var.update $info {
          value = $info
            |set:"RESEARCH_QUESTION":$RESEARCH_QUESTION
        }
      
        db.query RESEARCH_Files_ {
          where = $db.RESEARCH_Files.intervention_id == $input.intervention_id && $db.RESEARCH_Files.type == "findings" && $db.RESEARCH_Files.subsection == "findings"
          return = {type: "single"}
          output = ["txt_value"]
        } as $ASSUMPTION_TESTING_FINDINGS|get:"txt_value":null
      
        var.update $info {
          value = $info
            |set:"ASSUMPTION_TESTING_FINDINGS":$ASSUMPTION_TESTING_FINDINGS
        }
      }
    }
  }

  response = $info
}
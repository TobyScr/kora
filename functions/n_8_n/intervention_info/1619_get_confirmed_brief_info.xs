function "n8n/Intervention Info/Get confirmed Brief info" {
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
      if ($input.confirmed_steps|in:"Brief Overview") {
        db.get BRIEF_OUTPUT {
          field_name = "intervention_id"
          field_value = $input.intervention_id
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
            "section_stage_id"
            "expected_deliverables"
            "ta_profile"
            "dos"
            "donts"
          ]
        } as $BRIEF_OUTPUT
      
        var.update $info {
          value = $info|set:"BRIEF_OUTPUT":$BRIEF_OUTPUT
        }
      }
    }
  }

  response = $info
}
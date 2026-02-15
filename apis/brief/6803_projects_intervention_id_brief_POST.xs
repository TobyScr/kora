// Add BRIEF_OUTPUT record
query "projects/{intervention_id}/brief" verb=POST {
  api_group = "Brief"

  input {
    dblink {
      table = "BRIEF_OUTPUT"
      override = {is_confirmed: {hidden: true}}
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    }
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Brief Overview"
      }
    }
  
    function.run "Utils/Confuse commas in text array" {
      input = {text_array: $input.ta_profile}
    } as $ta_confused
  
    function.run "Utils/Confuse commas in text array" {
      input = {text_array: $input.dos}
    } as $dos_confused
  
    function.run "Utils/Confuse commas in text array" {
      input = {text_array: $input.donts}
    } as $donts_confused
  
    db.add BRIEF_OUTPUT {
      data = {
        created_at           : "now"
        intervention_id      : $input.intervention_id
        client               : $input.client
        location             : $input.location
        budget_currency      : $input.budget_currency
        budget_min           : $input.budget_min
        budget_max           : $input.budget_max
        timeline_unit        : $input.timeline_unit
        timeline_min         : $input.timeline_min
        timeline_max         : $input.timeline_max
        problem_definition   : $input.problem_definition
        high_level_objective : $input.high_level_objective
        is_confirmed         : false
        section_stage_id     : $input.section_stage_id
        expected_deliverables: $input.expected_deliverables
        ta_profile           : $ta_confused
        dos                  : $dos_confused
        donts                : $donts_confused
      }
    } as $model
  }

  response = $model
  tags = ["brief", "v2"]
}
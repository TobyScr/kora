// Add BRIEF_CHAT_OUTPUT record
query "projects/{intervention_id}/brief_chat" verb=POST {
  api_group = "Brief"
  auth = "USER"

  input {
    dblink {
      table = "BRIEF_CHAT_OUTPUT"
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
      input = {text_array: $input.dos}
    } as $dos_confused
  
    function.run "Utils/Confuse commas in text array" {
      input = {text_array: $input.donts}
    } as $donts_confused
  
    db.add BRIEF_CHAT_OUTPUT {
      data = {
        created_at                 : "now"
        intervention_id            : $input.intervention_id
        client_funder              : $input.client_funder
        core_challenge             : $input.core_challenge
        initial_objective          : $input.initial_objective
        initial_target_audience    : $input.initial_target_audience
        location                   : $input.location
        dos                        : $dos_confused
        donts                      : $donts_confused
        budget_amount              : $input.budget_amount
        budget_currency            : $input.budget_currency
        timeline_end_date          : $input.timeline_end_date
        expected_outputs           : $input.expected_outputs
        suggested_intervention_type: $input.suggested_intervention_type
      }
    } as $model
  }

  response = $model
  tags = ["brief", "v2"]
}
query generate_single_mrel verb=POST {
  api_group = "MREL Indicators"
  auth = "USER"

  input {
    int intervention_id?
    int os_indicator_type_id? {
      table = "OS_INDICATOR_TYPE"
    }
  }

  stack {
    function.run "n8n/design/generate_single_mrel" {
      input = {
        intervention_id     : $input.intervention_id
        os_indicator_type_id: $input.os_indicator_type_id
      }
    } as $func2
  }

  response = "started"
}
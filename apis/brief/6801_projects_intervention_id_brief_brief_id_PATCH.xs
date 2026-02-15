// Edit BRIEF_OUTPUT (doenst include is_confirmed)
query "projects/{intervention_id}/brief/{brief_id}" verb=PATCH {
  api_group = "Brief"
  auth = "USER"

  input {
    int brief_id? filters=min:1
    dblink {
      table = "BRIEF_OUTPUT"
      override = {
        is_confirmed       : {hidden: true}
        understand_stage_id: {hidden: true}
      }
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
  
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    function.run "Utils/Confuse commas in text array" {
      input = {text_array: $input.ta_profile}
    } as $ta_confused
  
    function.run "Utils/Confuse commas in text array" {
      input = {text_array: $input.dos}
    } as $dos_confused
  
    function.run "Utils/Confuse commas in text array" {
      input = {text_array: $input.donts}
    } as $donts_confused
  
    var $item {
      value = `$input|pick:($raw_input|keys)`
        |filter_null
        |filter_empty_text
        |set_ifnotempty:"dos":$dos_confused
        |set_ifnotempty:"donts":$donts_confused
        |set_ifnotempty:"ta_profile":$ta_confused
    }
  
    db.patch BRIEF_OUTPUT {
      field_name = "id"
      field_value = $input.brief_id
      data = $item
    } as $model
  }

  response = $model
  tags = ["brief", "v2"]
}
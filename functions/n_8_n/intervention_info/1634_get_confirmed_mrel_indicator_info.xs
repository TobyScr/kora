function "n8n/Intervention Info/Get confirmed MREL Indicator info" {
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
      if ($input.confirmed_steps|in:"MREL Indicators") {
        db.query MREL_INDICATORS {
          where = $db.MREL_INDICATORS.intervention_id == $input.intervention_id
          sort = {MREL_INDICATORS.indicator_type: "asc"}
          return = {type: "list"}
          output = ["indicator_type", "indicator", "target", "data_source"]
          addon = [
            {
              name  : "OS_INDICATOR_TYPE"
              output: ["name"]
              input : {OS_INDICATOR_TYPE_id: $output.indicator_type}
              as    : "indicator_type"
            }
          ]
        } as $MREL_INDICATORS
      
        var.update $info {
          value = $info
            |set:"MREL_INDICATORS":$MREL_INDICATORS
        }
      }
    }
  }

  response = $info
}
function "n8n/Intervention Info/Get Territory info" {
  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    json intervention_info
  }

  stack {
    var $info {
      value = $input.intervention_info
    }
  
    db.query TERRITORY {
      where = $db.TERRITORY.intervention_id == $input.intervention_id
      return = {type: "single"}
      output = ["title", "description", "credibility"]
    } as $TERRITORY
  
    var.update $info {
      value = $info|set:"TERRITORY":$TERRITORY
    }
  }

  response = $info
}
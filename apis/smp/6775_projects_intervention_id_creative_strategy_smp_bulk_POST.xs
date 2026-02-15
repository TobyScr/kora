// Add multiple SM_PROPOSITION records in bulk
query "projects/{intervention_id}/creative-strategy/smp/bulk" verb=POST {
  api_group = "SMP"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    text[] propositions filters=trim
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    }
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Single-Minded Proposition"
      }
    }
  
    var $items {
      value = []
    }
  
    foreach ($input.propositions) {
      each as $item {
        array.push $items {
          value = {}
            |set:"proposition":$item
            |set:"selected":false
            |set:"created_at":now
            |set:"intervention_id":$input.intervention_id
        }
      }
    }
  
    db.bulk.add SM_PROPOSITION {
      allow_id_field = false
      items = $items
    } as $model
  }

  response = $model
  tags = ["v2", "smp"]
}
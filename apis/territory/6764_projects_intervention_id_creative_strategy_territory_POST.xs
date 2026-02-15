// Add TERRITORY record
query "projects/{intervention_id}/creative-strategy/territory" verb=POST {
  api_group = "Territory"

  input {
    dblink {
      table = "TERRITORY"
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Territory"
      }
    } as $func2
  
    db.add TERRITORY {
      data = {
        intervention_id: $input.intervention_id
        created_at     : "now"
        title          : $input.title
        description    : $input.description
        credibility    : $input.credibility
        pros_cons      : $input.pros_cons
        recomended     : $input.recomended
        rationale      : $input.rationale
        selected       : false
      }
    } as $model
  }

  response = $model
  tags = ["v2", "territory"]
}
// Validate if the given intervention_id exists in the database
function "Utils/Intervention Exists" {
  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query INTERVENTION {
      where = $db.INTERVENTION.id == $input.intervention_id
      return = {type: "exists"}
    } as $EXISTS
  
    precondition ($EXISTS) {
      error_type = "notfound"
      error = "Intervention not found."
    }
  }

  response = null
}
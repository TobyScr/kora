// Get all COM_B records of a given type
query "projects/{intervention_id}/com-b/{type}" verb=GET {
  api_group = "COM-B"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    enum type? {
      values = ["capability", "opportunity", "motivation"]
    }
  }

  stack {
    db.query COM_B {
      where = $db.COM_B.intervention_id == $input.intervention_id && $db.COM_B.type == $input.type
      return = {type: "list"}
    } as $model
  }

  response = $model
  tags = ["com_b", "v2"]
}
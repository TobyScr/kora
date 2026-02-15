// Query all selected COM_B records
query "projects/{intervention_id}/com-b-selected" verb=GET {
  api_group = "COM-B"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query COM_B {
      where = $db.COM_B.intervention_id == $input.intervention_id && $db.COM_B.selected == true
      return = {type: "list"}
    } as $model
  }

  response = $model
  tags = ["com_b", "v2"]
}
// Query all COM_B records grouped by type
query "projects/{intervention_id}/com-b" verb=GET {
  api_group = "COM-B"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query COM_B {
      where = $db.COM_B.intervention_id == $input.intervention_id
      return = {type: "list"}
    } as $model
  
    array.group_by ($model) {
      by = $this.type
    } as $model
  }

  response = $model
  tags = ["com_b", "v2"]
}
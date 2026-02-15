addon COM_B {
  input {
    uuid COM_B_id? {
      table = "COM_B"
    }
  }

  stack {
    db.query COM_B {
      where = $db.COM_B.id == $input.COM_B_id
      return = {type: "single"}
    }
  }
}
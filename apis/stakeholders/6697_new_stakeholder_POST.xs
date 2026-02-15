// Add STAKEHOLDERS record
query new_stakeholder verb=POST {
  api_group = "Stakeholders"

  input {
    dblink {
      table = "STAKEHOLDERS"
    }
  }

  stack {
    db.add STAKEHOLDERS {
      data = {created_at: "now"}
    } as $stakeholders
  }

  response = $stakeholders
  tags = ["deprecated"]
}
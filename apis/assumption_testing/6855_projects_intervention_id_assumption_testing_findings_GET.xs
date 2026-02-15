// Retreive the RESEARCH_Files_ table entities related to the Assumption findings section of an intervention grouped by type
query "projects/{intervention_id}/assumption-testing/findings" verb=GET {
  api_group = "Assumption Testing"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query RESEARCH_Files_ {
      where = $db.RESEARCH_Files.intervention_id == $input.intervention_id && $db.RESEARCH_Files.subsection == "findings"
      return = {type: "list"}
    } as $RESEARCH_Files1
  
    array.group_by ($RESEARCH_Files1) {
      by = $this.type
    } as $grouped
  
    var.update $grouped {
      value = `$var.grouped|set_conditional:'findings':[]:($var.grouped|get:'findings'|is_empty)|set_conditional:'file':[]:($var.grouped|get:'file'|is_empty)`
    }
  }

  response = $grouped
  tags = ["v2", "assumption_finding"]
}
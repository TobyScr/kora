// Retreive the RESEARCH_Files_ table entities related to the Exising Research section of an intervention grouped by type
query "projects/{intervention_id}/research/existing-research" verb=GET {
  api_group = "Research"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query RESEARCH_Files_ {
      where = $db.RESEARCH_Files.intervention_id == $input.intervention_id && $db.RESEARCH_Files.subsection == "existing"
      return = {type: "list"}
    } as $RESEARCH_Files1
  
    array.group_by ($RESEARCH_Files1) {
      by = $this.type
    } as $grouped
  
    var.update $grouped {
      value = `$var.grouped|set_conditional:'url':[]:($var.grouped|get:'url'|is_empty)|set_conditional:'findings':[]:($var.grouped|get:'findings'|is_empty)|set_conditional:'file':[]:($var.grouped|get:'file'|is_empty)`
    }
  }

  response = $grouped
  tags = ["v2", "existing_research"]
}
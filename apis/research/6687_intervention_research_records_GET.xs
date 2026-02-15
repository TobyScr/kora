query intervention_research_records verb=GET {
  api_group = "Research"
  auth = "USER"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    int research_sections_id? {
      table = "RESEARCH_SECTIONS"
    }
  }

  stack {
    db.query RESEARCH_Files_ {
      where = $db.RESEARCH_Files.intervention_id == $input.intervention_id && $db.RESEARCH_Files.section_id == $input.research_sections_id
      return = {type: "list"}
    } as $filtredFiles
  
    foreach ($filtredFiles) {
      each as $item {
        var.update $item {
          value = $item
            |set:"section_id":($item.section_id|filter_empty:"")
        }
      }
    }
  }

  response = $filtredFiles
}
// get all uploaded research files
query research_files verb=GET {
  api_group = "Research"
  auth = "USER"

  input {
    int intervention_id?
  }

  stack {
    db.query RESEARCH {
      where = $db.RESEARCH.intervention_id == $input.intervention_id
      return = {type: "list"}
      output = ["id", "research_sections_id", "files_urls"]
    } as $RESEARCH1
  
    foreach ($RESEARCH1) {
      each as $item {
        var.update $item {
          value = $item
            |set:"files_urls":($item.files_urls|safe_array|filter_empty:"")
        }
      }
    }
  }

  response = $RESEARCH1
}
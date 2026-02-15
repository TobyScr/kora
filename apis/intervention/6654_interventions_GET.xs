query interventions verb=GET {
  api_group = "Intervention"
  auth = "USER"

  input {
    int project_id
    enum? alphabetical_sort? {
      values = ["asc", "desc"]
    }
  
    enum? modified_sort? {
      values = ["asc", "desc"]
    }
  }

  stack {
    var $sorts {
      value = []
    }
  
    conditional {
      if (($input.alphabetical_sort|is_empty) == false) {
        array.push $sorts {
          value = {}
            |set:"sortBy":"lower_name"
            |set:"orderBy":$input.alphabetical_sort
        }
      }
    
      // If no sort is given use the default option
      elseif ($input.modified_sort|is_empty) {
        array.push $sorts {
          value = {}
            |set:"sortBy":"lower_name"
            |set:"orderBy":"asc"
        }
      }
    }
  
    conditional {
      if (($input.modified_sort|is_empty) == false) {
        array.push $sorts {
          value = {}
            |set:"sortBy":"last_modified"
            |set:"orderBy":$input.modified_sort
        }
      }
    }
  
    db.query INTERVENTION {
      where = $db.INTERVENTION.project_id == $input.project_id
      override_sort = $sorts
      eval = {lower_name: $db.intervention.name|to_lower}
      return = {type: "list"}
      output = [
        "id"
        "created_at"
        "name"
        "current_step"
        "project_id"
        "is_deleted"
        "is_duplicated"
        "last_modified"
        "chat_id"
        "percentage"
      ]
    } as $model
  }

  response = $model
}
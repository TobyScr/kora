query projects verb=GET {
  api_group = "Project"
  auth = "USER"

  input {
    int client_id
    text? project_name? filters=trim
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
            |set:"sortBy":"last_updated_at"
            |set:"orderBy":$input.modified_sort
        }
      }
    }
  
    db.query PROJECT {
      where = $db.PROJECT.client_id == $input.client_id && $db.PROJECT.name includes? $input.project_name && $db.PROJECT.name != ""
      override_sort = $sorts
      eval = {lower_name: $db.project.name|to_lower}
      return = {type: "list"}
      output = [
        "id"
        "created_at"
        "name"
        "client_id"
        "number_of_interventions"
        "last_updated_at"
        "is_deleted"
      ]
    } as $model
  }

  response = $model
}
function "Migration/Get Ids from Map" {
  input {
    json databaseIds?
    text string? filters=trim
    text separator?="," filters=trim
  }

  stack {
    var $ids {
      value = []
    }
  
    foreach ($input.string
      |split:$input.separator
      |trim:""
      |to_lower
    ) {
      each as $langName {
        array.push $ids {
          value = $input.databaseIds|get:($langName|to_lower):null
        }
      }
    }
    var.update $ids {
      value = $ids|safe_array|filter_empty:""
    }
  }

  response = $ids
}
// Replace the - from the starts of a list of texts
function "Utils/Remove dash from text start" {
  input {
    json obj
    text field_name? filters=trim
  }

  stack {
    // Given an object and a field name
    // 
    // Remove the starting - from each of the texts
    // 
    // [
    //     "- This is an example",
    //     "- This is an example",
    //     "- This is an example"
    // ]
    //
  
    var $object {
      value = $input.obj
    }
  
    var $replaced {
      value = []
    }
  
    foreach ($object|get:$input.field_name:[]) {
      each as $text {
        array.push $replaced {
          value = `"/^-/"|regex_replace:"":$var.text`
        }
      }
    }
  
    var.update $object {
      value = $object|set:$input.field_name:$replaced
    }
  }

  response = $object
}
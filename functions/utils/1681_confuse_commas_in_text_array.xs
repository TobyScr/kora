// Replace the commas in the texts inside an array with ꓹ
function "Utils/Confuse commas in text array" {
  input {
    text[] text_array filters=trim
  }

  stack {
    // Due to the constraints with the commas in database text array fields
    // 
    // We had to replace any comma with the Confusable Character ‚
    // 
    // https://util.unicode.org/UnicodeJsps/confusables.jsp?a=%2C&r=None
    // 
    // This is the unicode character SINGLE LOW-9 QUOTATION MARK 201A, in the frontend it looks like our normal comma.
    // 
    // But since it isnt the normal unicode comma it can be added to the text without altering the array
  
    var $confused {
      value = []
    }
  
    foreach ($input.text_array) {
      each as $text {
        array.push $confused {
          value = $text|replace:",":"‚"
        }
      }
    }
  }

  response = $confused
}
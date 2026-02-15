function "HypeAuditor/Test mapping" {
  input {
  }

  stack {
    function.run "HypeAuditor/Request Report" {
      input = {
        social_lookout: "INSTAGRAM"
        lookup_value  : "vancityreynolds"
      }
    } as $INSTAGRAM
  
    function.run "HypeAuditor/Create object from API data" {
      input = {
        type    : "INSTAGRAM"
        response: $INSTAGRAM|get:"response":null|get:"result":null|get:"result":null
      }
    } as $INSTAGRAM_OBJ
  
    function.run "HypeAuditor/Request Report" {
      input = {social_lookout: "TIKTOK", lookup_value: "littlebig"}
    } as $TIKTOK
  
    function.run "HypeAuditor/Create object from API data" {
      input = {
        type    : "TIKTOK"
        response: $TIKTOK|get:"response":null|get:"result":null|get:"result":null
      }
    } as $TIKTOK_OBJ
  
    function.run "HypeAuditor/Request Report" {
      input = {
        social_lookout: "YOUTUBE"
        lookup_value  : "kendalljenner"
      }
    } as $YOUTUBE
  
    function.run "HypeAuditor/Create object from API data" {
      input = {
        type    : "YOUTUBE"
        response: $YOUTUBE|get:"response":null|get:"result":null|get:"result":null
      }
    } as $YOUTUBE_OBJ
  }

  response = {
    INSTAGRAM_OBJ: $INSTAGRAM_OBJ
    TIKTOK_OBJ   : $TIKTOK_OBJ
    YOUTUBE_OBJ  : $YOUTUBE_OBJ
  }
}
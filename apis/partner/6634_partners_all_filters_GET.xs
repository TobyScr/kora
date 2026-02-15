// This endpoint returns the list of available filters for the frontend to use.
query "partners/all-filters" verb=GET {
  api_group = "Partner"
  auth = "USER"

  input {
  }

  stack {
    var $result {
      value = {}
    }
  
    function.run "Query All Country records" as $countries
    function.run "Query All Entity Type records" as $entityTypes
    function.run "Query All Language records" as $languages
    function.run "Query All Topic records" as $topics
    function.run "Query All Social Media Channel records" as $socialMedias
    function.run "Find min and max of social media followers" as $socialMediaNumbers
    var.update $result {
      value = $result
        |set:"countries":$countries
        |set:"entity_types":$entityTypes
        |set:"languages":$languages
        |set:"topics":$topics
        |set:"social_medias":$socialMedias
        |set:"minimum_social_media_followers":$socialMediaNumbers.min
        |set:"maximum_social_media_followers":$socialMediaNumbers.max
    }
  }

  response = $result
}
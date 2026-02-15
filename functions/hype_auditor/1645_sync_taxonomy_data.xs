// Sync HA taxonomy data regarding creators categories.
// 
// https://hypeauditor.readme.io/reference/taxonomy_v1
function "HypeAuditor/Sync Taxonomy Data" {
  input {
  }

  stack {
    // Sync HA taxonomy data regarding creators categories.
    // 
    // https://hypeauditor.readme.io/reference/taxonomy_v1
  
    var $hyper_url {
      value = "https://hypeauditor.com/api/method/auditor.taxonomy"
    }
  
    var $HEADERS {
      value = []
        |push:("x-auth-id: "|concat:$env.hype_auth_id:"")
        |push:("x-auth-token: "|concat:$env.hype_auth_token:"")
    }
  
    api.request {
      url = $hyper_url
      method = "GET"
      headers = $HEADERS
      verify_host = false
      verify_peer = false
    } as $response
  
    precondition ($var.response.response.status == 200) {
      error = "Request failed."
    }
  
    // Group the response by social media
  
    var $categories_by_social {
      value = {}
        |set:"INSTAGRAM":$var.response.response.result.result.ig.categories
        |set:"YOUTUBE":$var.response.response.result.result.yt.thematics
        |set:"TIKTOK":$var.response.response.result.result.tt.categories
    }
  
    var $categories_keys {
      value = $categories_by_social|keys
    }
  
    // For each of the social medias update the entry to be in our database format
  
    foreach ($categories_keys) {
      each as $key {
        var $list {
          value = []
        }
      
        foreach ($categories_by_social|get:$key:[]) {
          each as $item {
            array.push $list {
              value = {}
                |set:"ha_id":$item.id
                |set:"title":$item.title
                |set:"social":$key
            }
          }
        }
      
        var.update $categories_by_social {
          value = $categories_by_social|set:$key:$list
        }
      }
    }
  
    // Get the current list categories from our database
  
    db.query HA_CATEGORIES {
      sort = {HA_CATEGORIES.social: "asc"}
      return = {type: "list"}
      output = ["ha_id", "social", "title"]
    } as $HA_CATEGORIES
  
    array.group_by ($HA_CATEGORIES) {
      by = $this.social
    } as $HA_CATEGORIES
  
    foreach ($categories_keys) {
      each as $key {
        // Find the missing categories and add them
      
        array.difference ($categories_by_social|get:$key:[]) {
          value = $HA_CATEGORIES
            |get:$key:('[{"ha_id":"-1"}]'|json_decode)
          by = $this.ha_id
        } as $filtered
      
        db.bulk.add HA_CATEGORIES {
          allow_id_field = false
          items = $filtered
        }
      }
    }
  }

  response = null
  tags = ["hype_auditor"]
}
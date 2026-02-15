function "n8n/design/generate_cbd" {
  input {
    int intervention_id?
  }

  stack {
    db.schema CBD_BRIEF {
      path = ""
    } as $CBD_BRIEF1
  
    db.schema CBD_AUDIENCE {
      path = ""
    } as $CBD_AUDIENCE1
  
    db.schema CBD_INTRODUCTION {
      path = ""
    } as $CBD_INTRODUCTION1
  
    api.request {
      url = "/webhook/generate_cbd"
      method = "POST"
      params = {}
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
        |set:"xano_base_url":$env.base_url
        |set:"audience":$CBD_AUDIENCE1
        |set:"brief":$CBD_BRIEF1
        |set:"introduction":$CBD_INTRODUCTION1
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $api1
}
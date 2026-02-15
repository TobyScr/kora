function "n8n/scraping" {
  input {
    text file_id? filters=trim
    text file_url? filters=trim
    text file_name? filters=trim
    int intervention_id?
  }

  stack {
    api.request {
      url = "/webhook/scrape_url"
      method = "POST"
      params = {}
        |set:"file_id":$input.file_id
        |set:"file_url":$input.file_url
        |set:"file_name":$input.file_name
        |set:"intervention_id":$input.intervention_id
        |set:"data_source":$env.$datasource
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $api1
}
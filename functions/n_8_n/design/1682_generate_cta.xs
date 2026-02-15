function "n8n/design/generate_cta" {
  input {
    int intervention_id?
  }

  stack {
    db.schema CTA {
      path = ""
    } as $CTA
  
    api.request {
      url = "/webhook/generate_cta"
      method = "POST"
      params = {}
        |set:"xano_schema":"CTA"
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
        |set:"xano_base_url":$env.base_url
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $CTA
}
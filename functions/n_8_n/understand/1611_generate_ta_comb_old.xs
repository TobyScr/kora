function "n8n/understand/generate_ta_comb_old" {
  input {
    int intervention_id?
  }

  stack {
    !db.schema "" {
      path = ""
    } as $COM_B
  
    !api.request {
      url = "/webhook/generate_comb"
      method = "POST"
      params = {}
        |set:"xano_schema":$COM_B
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = {status: "started"}
}
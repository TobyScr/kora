function "n8n/understand/generate_single_comb" {
  input {
    int intervention_id?
    enum comb_type? {
      values = ["capability", "opportunity", "motivation"]
    }
  }

  stack {
    db.schema COM_B {
      path = ""
    } as $COM_B
  
    api.request {
      url = "/webhook/generate_single_comb"
      method = "POST"
      params = {}
        |set:"xano_schema":$COM_B
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
        |set:"comb_type":$input.comb_type
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = {status: "started"}
}
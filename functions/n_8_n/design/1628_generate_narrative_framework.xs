function "n8n/design/generate_narrative_framework" {
  input {
    int intervention_id?
  }

  stack {
    db.schema CORE_NARRATIVE {
      path = ""
    } as $CORE_NARRATIVE1
  
    db.schema KEY_MESSAGE {
      path = ""
    } as $KEY_MESSAGE1
  
    api.request {
      url = "/webhook/generate_narrative"
      method = "POST"
      params = {}
        |set:"xano_schema_core_narrative":$CORE_NARRATIVE1
        |set:"xano_schema_key_message":$KEY_MESSAGE1
        |set:"status":"success"
        |set:"intervention":$input.intervention_id
        |set:"data_source":$env.$datasource
        |set:"xano_base_url":$env.base_url
      headers = []
        |push:"Content-Type: application/json"
    } as $api1
  }

  response = $api1
}
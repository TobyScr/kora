function "ai_router test" {
  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    int confirmed_step_id? {
      table = "WORKFLOW_STEP"
    }
  
    int step_log_id? {
      table = "STEP_CONFIRMATION_LOG"
    }
  }

  stack {
    db.get WORKFLOW_STEP {
      field_name = "id"
      field_value = $input.confirmed_step_id
    } as $confirmed_step
  
    conditional {
      if ($confirmed_step.triggers != 0) {
        db.get WORKFLOW_STEP {
          field_name = "id"
          field_value = $confirmed_step.triggers
        } as $triggered_step
      
        // UNDERSTAND STAGE
        switch ($triggered_step.ai_slug) {
          case ("generate_deepresearch_prompts") {
            db.schema RESEARCH_DEEPRESEARCH_PROMPTS {
              path = ""
            } as $RESEARCH_DEEPRESEARCH_PROMPTS
          
            api.request {
              url = "/webhook/generate_deep_research"
              method = "POST"
              params = {}
                |set:"xano_schema":$RESEARCH_DEEPRESEARCH_PROMPTS
                |set:"intervention":$input.intervention_id
                |set:"data_source":$env.$datasource
              headers = []
                |push:"Content-Type: application/json"
            } as $api1
          } break
        
          case ("generate_system_map") {
            db.schema SYSTEM_MAP {
              path = ""
            } as $schema_system_map
          
            api.request {
              url = "/webhook/generate_system_map"
              method = "POST"
              params = {}
                |set:"message":$schema_system_map
                |set:"status":"success"
                |set:"intervention":$input.intervention_id
                |set:"data_source":$env.$datasource
              headers = []
                |push:"Content-Type: application/json"
            } as $api1
          } break
        
          case ("generate_behavioural_objective") {
            db.schema BEHAVIOURAL_OBJECTIVE_NEW {
              path = ""
            } as $schema_behavioural_objective
          
            api.request {
              url = "/webhook/behavior_objective"
              method = "POST"
              params = {}
                |set:"xano_schema":$schema_behavioural_objective
                |set:"status":"success"
                |set:"intervention":$input.intervention_id
                |set:"data_source":$env.$datasource
              headers = []
                |push:"Content-Type: application/json"
            } as $api1
          } break
        
          case ("generate_assumption") {
            db.schema ASSUMPTION {
              path = ""
            } as $schema_assumption
          
            api.request {
              url = "/webhook/generate_assumption"
              method = "POST"
              params = {}
                |set:"xano_schema":$schema_assumption
                |set:"status":"success"
                |set:"intervention":$input.intervention_id
                |set:"data_source":$env.$datasource
              headers = []
                |push:"Content-Type: application/json"
            } as $api1
          } break
        
          case ("generate_comb") {
            db.schema COM_B {
              path = ""
            } as $schema_com_b
          
            api.request {
              url = "/webhook/generate_comb"
              method = "POST"
              params = {}
                |set:"xano_schema":$schema_com_b
                |set:"status":"success"
                |set:"intervention":$input.intervention_id
                |set:"data_source":$env.$datasource
              headers = []
                |push:"Content-Type: application/json"
            } as $api1
          } break
        
          case ("generate_persona") {
            db.schema DEMOGRAPHICS {
              path = ""
            } as $DEMOGRAPHICS
          
            db.schema PSYCHOGRAPHICS {
              path = ""
            } as $PSYCHOGRAPHICS
          
            db.schema CONTEXT_MEDIA {
              path = ""
            } as $CONTEXT_BEHAVIORS
          
            api.request {
              url = "/webhook/generate_persona"
              method = "POST"
              params = {}
                |set:"schema_demographics":$DEMOGRAPHICS
                |set:"schema_psychographics":$PSYCHOGRAPHICS
                |set:"schema_context_behaviors":$CONTEXT_BEHAVIORS
                |set:"status":"success"
                |set:"intervention":$input.intervention_id
                |set:"data_source":$env.$datasource
              headers = []
                |push:"Content-Type: application/json"
            } as $api1
          } break
        }
      
        var $workflow_result {
          value = $api1.response.status
        }
      
        db.add ai_execution_log {
          data = {
            created_at              : "now"
            step_confirmation_log_id: $input.step_log_id
            status                  : $workflow_result
            n8n_triggered_workflow  : $triggered_step.ai_slug
            action                  : "started"
            intervention_id         : $input.intervention_id
          }
        } as $ai_router_log1
      }
    
      else {
        var $workflow_result {
          value = 200
        }
      }
    }
  }

  response = $workflow_result
}
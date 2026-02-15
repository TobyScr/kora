query "intervention/{intervention_id}/duplicate" verb=POST {
  api_group = "Intervention"
  auth = "USER"

  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  
    enum until? {
      values = ["brief", "understand"]
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    }
  
    db.get INTERVENTION {
      field_name = "id"
      field_value = $input.intervention_id
    } as $INTERVENTION
  
    db.query STEP_CONFIRMATION_LOG {
      where = $db.STEP_CONFIRMATION_LOG.intervention_id == $input.intervention_id
      return = {type: "list"}
      output = ["step_id"]
      addon = [
        {
          name  : "WORKFLOW_STEP"
          output: ["name"]
          input : {WORKFLOW_STEP_id: $output.step_id}
        }
      ]
    } as $confirmed_steps
  
    // Selecting POSSIBLE stages to clone
    conditional {
      if ($input.until == "brief") {
        var $steps {
          value = ["Brief Overview"]
        }
      }
    
      else {
        db.query WORKFLOW_STEP {
          where = $db.WORKFLOW_STEP.group == 0
          sort = {WORKFLOW_STEP.group: "asc", WORKFLOW_STEP.order: "asc"}
          return = {type: "list"}
          output = ["name"]
        } as $steps|get:"name":null|safe_array|filter_empty:""
      }
    }
  
    db.transaction {
      stack {
        db.add INTERVENTION {
          data = {
            created_at   : "now"
            name         : $INTERVENTION.name|concat:"Copy By ":" "|concat:$auth.id:""
            current_step : $INTERVENTION.current_step
            project_id   : $INTERVENTION.project_id
            is_duplicated: true
            chat_id      : $INTERVENTION.chat_id
            helper_text  : 1
          }
        } as $CLONE
      
        // Clone the confirmation logs
        group {
          stack {
            db.query STEP_CONFIRMATION_LOG {
              join = {
                WORKFLOW_STEP: {
                  table: "WORKFLOW_STEP"
                  type : "left"
                  where: $db.STEP_CONFIRMATION_LOG.step_id == $db.WORKFLOW_STEP.id
                }
              }
            
              where = $db.STEP_CONFIRMATION_LOG.intervention_id == $input.intervention_id && $db.WORKFLOW_STEP.name in $steps
              sort = {WORKFLOW_STEP.group: "asc", WORKFLOW_STEP.order: "asc"}
              eval = {name: $db.WORKFLOW_STEP.name}
              return = {type: "list"}
              output = ["confirmed_at", "intervention_id", "step_id", "user_id", "name"]
            } as $STEP_CONFIRMATION_LOG
          
            foreach ($STEP_CONFIRMATION_LOG) {
              each as $item {
                var.update $item {
                  value = $item|set:"intervention_id":$CLONE.id
                }
              }
            }
          
            db.bulk.add STEP_CONFIRMATION_LOG {
              allow_id_field = false
              items = $STEP_CONFIRMATION_LOG
            }
          }
        }
      
        // Update intervention current step
        group {
          stack {
            conditional {
              if ($env.$datasource == "dev") {
                var $source {
                  value = "x38_dev_117"
                }
              }
            
              else {
                var $source {
                  value = "x38_117"
                }
              }
            }
          
            db.direct_query {
              sql = """
                WITH ordered_steps AS (
                    SELECT name, 
                           LEAD(id) OVER (ORDER BY "group" ASC, "order" ASC) as next_id
                    FROM ?:raw
                )
                SELECT next_id 
                FROM ordered_steps 
                WHERE name = ?;
                """
              response_type = "single"
              arg = $source
              arg = $STEP_CONFIRMATION_LOG|last|get:"name":""
            } as $next_step|get:"next_id":""
          
            db.edit INTERVENTION {
              field_name = "id"
              field_value = $CLONE.id
              data = {current_step: $next_step}
            }
          }
        }
      
        foreach ($STEP_CONFIRMATION_LOG
          |get:"name":""
          |safe_array
          |filter_empty:""
          |unique:""
        ) {
          each as $item {
            switch ($item) {
              case ("Brief Overview") {
                db.get BRIEF_OUTPUT {
                  field_name = "intervention_id"
                  field_value = $input.intervention_id
                } as $OLD|set:"intervention_id":$CLONE.id|set:"created_at":now|unset:"id"
              
                db.bulk.add BRIEF_OUTPUT {
                  allow_id_field = false
                  items = [$OLD]
                }
              
                db.query BRIEF_CHAT_OUTPUT {
                  where = $db.BRIEF_CHAT_OUTPUT.intervention_id == $input.intervention_id
                  return = {type: "list"}
                } as $OLD|set:"intervention_id":$CLONE.id|set:"created_at":now|unset:"id"
              
                db.bulk.add BRIEF_CHAT_OUTPUT {
                  allow_id_field = false
                  items = $OLD
                }
              } break
            
              case ("Research Insights") {
                db.query RESEARCH_Files_ {
                  where = $db.RESEARCH_Files.intervention_id == $input.intervention_id && ($db.RESEARCH_Files.subsection == "existing" || $db.RESEARCH_Files.subsection == "deep")
                  return = {type: "list"}
                } as $OLD
              
                conditional {
                  if (($OLD|is_empty) == false) {
                    var.update $OLD {
                      value = $OLD
                        |set:"intervention_id":$CLONE.id
                        |set:"created_at":now
                        |unset:"id"
                    }
                  
                    db.bulk.add RESEARCH_Files_ {
                      allow_id_field = false
                      items = $OLD
                    }
                  }
                }
              
                db.query RESEARCH_INSIGHTS {
                  where = $db.RESEARCH_INSIGHTS.intervention_id == $input.intervention_id
                  return = {type: "list"}
                } as $OLD
              
                conditional {
                  if (($OLD|is_empty) == false) {
                    var.update $OLD {
                      value = $OLD
                        |set:"intervention_id":$CLONE.id
                        |set:"created_at":now
                        |unset:"id"
                    }
                  
                    db.bulk.add RESEARCH_INSIGHTS {
                      allow_id_field = false
                      items = $OLD
                    }
                  }
                }
              } break
            
              case ("System Map") {
                db.query SYSTEM_MAP {
                  where = $db.SYSTEM_MAP.intervention_id == $input.intervention_id
                  return = {type: "list"}
                } as $OLD|set:"intervention_id":$CLONE.id|set:"created_at":now|unset:"id"
              
                db.bulk.add SYSTEM_MAP {
                  allow_id_field = false
                  items = $OLD
                }
              } break
            
              case ("Behavioural Objective") {
                db.query BEHAVIOURAL_OBJECTIVE_NEW {
                  where = $db.BEHAVIOURAL_OBJECTIVE_NEW.intervention_id == $input.intervention_id
                  return = {type: "list"}
                } as $OLD|set:"intervention_id":$CLONE.id|set:"created_at":now|unset:"id"
              
                db.bulk.add BEHAVIOURAL_OBJECTIVE_NEW {
                  allow_id_field = false
                  items = $OLD
                }
              } break
            
              case ("Assumption Testing") {
                db.query ASSUMPTION {
                  where = $db.ASSUMPTION.intervention_id == $input.intervention_id
                  return = {type: "list"}
                } as $OLD|set:"intervention_id":$CLONE.id|set:"created_at":now|unset:"id"
              
                db.bulk.add ASSUMPTION {
                  allow_id_field = false
                  items = $OLD
                }
              
                db.query RESEARCH_QUESTION {
                  where = $db.RESEARCH_QUESTION.intervention_id == $input.intervention_id
                  return = {type: "list"}
                } as $OLD|set:"intervention_id":$CLONE.id|set:"created_at":now|unset:"id"
              
                db.bulk.add RESEARCH_QUESTION {
                  allow_id_field = false
                  items = $OLD
                }
              
                db.query RESEARCH_Files_ {
                  where = $db.RESEARCH_Files.intervention_id == $input.intervention_id && $db.RESEARCH_Files.subsection == "findings"
                  return = {type: "list"}
                } as $OLD|set:"intervention_id":$CLONE.id|set:"created_at":now|unset:"id"
              
                db.bulk.add RESEARCH_Files_ {
                  allow_id_field = false
                  items = $OLD
                }
              } break
            
              case ("COM-B") {
                db.query COM_B {
                  where = $db.COM_B.intervention_id == $input.intervention_id
                  return = {type: "list"}
                } as $OLD|set:"intervention_id":$CLONE.id|set:"created_at":now|unset:"id"
              
                db.bulk.add COM_B {
                  allow_id_field = false
                  items = $OLD
                }
              } break
            
              case ("Personas") {
                db.query PERSONA {
                  where = $db.PERSONA.intervention_id == $input.intervention_id
                  return = {type: "list"}
                } as $OLD
              
                foreach ($OLD) {
                  each as $person {
                    var $create {
                      value = {}
                        |set:"intervention_id":$CLONE.id
                        |set:"created_at":now
                    }
                  
                    db.get CONTEXT_MEDIA {
                      field_name = "id"
                      field_value = $person.context_media_id
                      output = [
                        "social_influencer_network"
                        "media_consumption_habits"
                        "language_symbols"
                      ]
                    } as $CONTEXT_MEDIA
                  
                    db.bulk.add CONTEXT_MEDIA {
                      allow_id_field = false
                      items = []|push:$CONTEXT_MEDIA
                    } as $CONTEXT_MEDIA|first
                  
                    var.update $create {
                      value = $create
                        |set:"context_media_id":$CONTEXT_MEDIA
                    }
                  
                    db.get DEMOGRAPHICS {
                      field_name = "id"
                      field_value = $person.demographics_id
                      output = [
                        "location"
                        "language"
                        "children"
                        "employment"
                        "education"
                        "name"
                        "age"
                        "gender"
                        "marital_status"
                        "quote"
                        "file.access"
                        "file.path"
                        "file.name"
                        "file.type"
                        "file.size"
                        "file.mime"
                        "file.meta"
                        "file.url"
                      ]
                    } as $DEMOGRAPHICS
                  
                    db.bulk.add DEMOGRAPHICS {
                      allow_id_field = false
                      items = []|push:$DEMOGRAPHICS
                    } as $DEMOGRAPHICS|first
                  
                    var.update $create {
                      value = $create
                        |set:"demographics_id":$DEMOGRAPHICS
                    }
                  
                    db.get PSYCHOGRAPHICS {
                      field_name = "id"
                      field_value = $person.psychographics_id
                      output = ["values", "aspirations", "life_goals", "concerns_challenges"]
                    } as $PSYCHOGRAPHICS
                  
                    db.bulk.add PSYCHOGRAPHICS {
                      allow_id_field = false
                      items = []|push:$PSYCHOGRAPHICS
                    } as $PSYCHOGRAPHICS|first
                  
                    var.update $create {
                      value = $create
                        |set:"psychographics_id":$PSYCHOGRAPHICS
                    }
                  
                    db.bulk.add PERSONA {
                      allow_id_field = false
                      items = []|push:$create
                    }
                  }
                }
              } break
            }
          }
        }
      }
    }
  }

  response = "duplicated"
}
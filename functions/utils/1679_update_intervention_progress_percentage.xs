// Update the completion percentage of a given intervention based on the STEP_CONFIRMATION_LOG
function "Utils/Update Intervention progress percentage" {
  input {
    int intervention_id? {
      table = "INTERVENTION"
    }
  }

  stack {
    // Create a map with the number of steps per section
    group {
      stack {
        db.query WORKFLOW_STEP {
          return = {type: "list"}
          output = ["name", "group"]
        } as $ALL_STEPS
      
        array.group_by ($ALL_STEPS) {
          by = $this.group
        } as $ALL_STEPS
      
        var $section_steps_number {
          value = {}
        }
      
        foreach ($ALL_STEPS|entries) {
          each as $item {
            var $group {
              value = $item.key
            }
          
            var $count {
              value = $item.value|count
            }
          
            var.update $section_steps_number {
              value = $section_steps_number|set:$group:$count
            }
          }
        }
      }
    }
  
    // Calculate the current completion of each section
    group {
      stack {
        var $group_completion_percentage {
          value = []
        }
      
        foreach ($section_steps_number|keys) {
          each as $group {
            db.query STEP_CONFIRMATION_LOG {
              join = {
                WORKFLOW_STEP: {
                  table: "WORKFLOW_STEP"
                  where: $db.STEP_CONFIRMATION_LOG.step_id == $db.WORKFLOW_STEP.id
                }
              }
            
              where = $db.WORKFLOW_STEP.group == $group && $db.STEP_CONFIRMATION_LOG.intervention_id == $input.intervention_id
              return = {type: "list", distinct: "yes"}
              output = ["step_id"]
            } as $confirmed_steps_count|get:"step_id":null|safe_array|filter_empty:""|unique:""|count
          
            var $full_step_count {
              value = $section_steps_number|get:$group:null
            }
          
            var.update $group_completion_percentage {
              value = $group_completion_percentage
                |push:($confirmed_steps_count|divide:$full_step_count)
            }
          }
        }
      }
    }
  
    var $complete_percentage {
      value = 0
    }
  
    var $section_percentage {
      value = 100
        |divide:($section_steps_number|keys|count)
    }
  
    foreach ($group_completion_percentage) {
      each as $group_percentage {
        var.update $complete_percentage {
          value = $complete_percentage
            |add:($section_percentage|multiply:$group_percentage)
        }
      }
    }
  
    var.update $complete_percentage {
      value = `$var.complete_percentage|round:0`
    }
  
    db.edit INTERVENTION {
      field_name = "id"
      field_value = $input.intervention_id
      data = {percentage: $complete_percentage}
      output = ["id"]
    }
  }

  response = null
}
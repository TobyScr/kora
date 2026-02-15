// Add the respective records for the Creative Brief section
query "projects/{intervention_id}/documentation/creative-brief" verb=POST {
  api_group = "Creative Brief"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    dblink {
      table = "CBD_AUDIENCE"
      override = {
        created_at     : {hidden: true}
        intervention_id: {hidden: true}
      }
    }
  
    dblink {
      table = "CBD_BRIEF"
      override = {
        created_at     : {hidden: true}
        intervention_id: {hidden: true}
      }
    }
  
    dblink {
      table = "CBD_INTRODUCTION"
      override = {
        created_at     : {hidden: true}
        intervention_id: {hidden: true}
      }
    }
  }

  stack {
    function.run "Utils/Intervention Exists" {
      input = {intervention_id: $input.intervention_id}
    } as $func1
  
    function.run "Utils/Can be edited or is it Confirmed" {
      input = {
        intervention_id: $input.intervention_id
        step           : "Creative Brief"
      }
    } as $func2
  
    db.transaction {
      stack {
        db.add CBD_INTRODUCTION {
          data = {
            intervention_id: $input.intervention_id
            created_at     : "now"
            summary        : $input.summary
            context        : $input.context
            problem        : $input.problem
            objectives     : $input.objectives
          }
        } as $CBD_INTRODUCTION
      
        db.add CBD_AUDIENCE {
          data = {
            intervention_id: $input.intervention_id
            created_at     : "now"
            target_profile : $input.target_profile
            barriers       : $input.barriers
            strategy       : $input.strategy
          }
        } as $CBD_AUDIENCE
      
        db.add CBD_BRIEF {
          data = {
            intervention_id: $input.intervention_id
            territory      : $input.territory
            cta            : $input.cta
            smp            : $input.smp
            key_messages   : $input.key_messages
            created_at     : "now"
            tfd_shift      : $input.tfd_shift
            deliverables   : $input.deliverables
            timings        : $input.timings
            mandatories    : $input.mandatories
            budget         : $input.budget
            inspiration    : $input.inspiration
          }
        } as $CBD_BRIEF
      }
    }
  }

  response = {
    INTRODUCTION: $CBD_INTRODUCTION
    AUDIENCE    : $CBD_AUDIENCE
    BRIEF       : $CBD_BRIEF
  }

  tags = ["v2", "creative_brief"]
}
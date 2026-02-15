function "n8n/Intervention Info/Get confirmed CBD info" {
  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  
    json intervention_info
    text[] confirmed_steps
  }

  stack {
    var $info {
      value = $input.intervention_info
    }
  
    conditional {
      if ($input.confirmed_steps|in:"Creative Brief") {
        db.query CBD_INTRODUCTION {
          where = $db.CBD_INTRODUCTION.intervention_id == $input.intervention_id
          return = {type: "single"}
          output = ["summary", "context", "problem", "objectives"]
        } as $CBD_INTRODUCTION
      
        var.update $info {
          value = $info
            |set:"CBD_INTRODUCTION":$CBD_INTRODUCTION
        }
      
        db.query CBD_BRIEF {
          where = $db.CBD_BRIEF.intervention_id == $input.intervention_id
          return = {type: "single"}
          output = [
            "territory"
            "cta"
            "smp"
            "key_messages"
            "tfd_shift"
            "deliverables"
            "timings"
            "mandatories"
            "budget"
            "inspiration"
          ]
        } as $CBD_BRIEF
      
        var.update $info {
          value = $info|set:"CBD_BRIEF":$CBD_BRIEF
        }
      
        db.query CBD_AUDIENCE {
          where = $db.CBD_AUDIENCE.intervention_id == $input.intervention_id
          return = {type: "single"}
          output = ["target_profile", "barriers", "strategy"]
        } as $CBD_AUDIENCE
      
        var.update $info {
          value = $info|set:"CBD_AUDIENCE":$CBD_AUDIENCE
        }
      }
    }
  }

  response = $info
}
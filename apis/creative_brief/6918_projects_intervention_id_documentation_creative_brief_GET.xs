// Get Creative Brief section records
query "projects/{intervention_id}/documentation/creative-brief" verb=GET {
  api_group = "Creative Brief"
  auth = "USER"

  input {
    int intervention_id {
      table = "INTERVENTION"
    }
  }

  stack {
    db.query CBD_INTRODUCTION {
      where = $db.CBD_INTRODUCTION.intervention_id == $input.intervention_id
      return = {type: "single"}
    } as $CBD_INTRODUCTION
  
    db.query CBD_AUDIENCE {
      where = $db.CBD_AUDIENCE.intervention_id == $input.intervention_id
      return = {type: "single"}
    } as $CBD_AUDIENCE
  
    db.query CBD_BRIEF {
      where = $db.CBD_BRIEF.intervention_id == $input.intervention_id
      return = {type: "single"}
    } as $CBD_BRIEF
  }

  response = {
    INTRODUCTION: $CBD_INTRODUCTION
    AUDIENCE    : $CBD_AUDIENCE
    BRIEF       : $CBD_BRIEF
  }

  tags = ["v2", "creative_brief"]
}
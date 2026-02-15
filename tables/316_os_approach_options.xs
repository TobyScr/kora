table OS_APPROACH_OPTIONS {
  auth = false

  schema {
    uuid id
    enum type? {
      values = ["Skip Creative Strategy", "Develop Creative Strategy"]
    }
  
    text description?
    json[] steps_outputs?
  }

  index = [{type: "primary", field: [{name: "id"}]}]
  tags = ["active", "v2", "approach"]
}
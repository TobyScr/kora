// This function will add the csv database to Xano and do all the necessary transformations!
function "Start Main database sync" {
  input {
    file? database
  }

  stack {
    stream.from_csv {
      value = $input.database
      separator = ","
      enclosure = '"'
      escape_char = '"'
    } as $stream1
  
    foreach ($stream1) {
      each as $item {
        db.get PARTNER {
          field_name = "name"
          field_value = $item.Name
        } as $PARTNER_original
      
        conditional {
          if ($PARTNER_original == null) {
            var $zincEngagementResult {
              value = ""
            }
          
            conditional {
              if (($item["Past Zinc Engagement (Yes/No)"]|to_lower) != "n/a" && ($item["Past Zinc Engagement (Yes/No)"]|to_lower) != "no") {
                var.update $zincEngagementResult {
                  value = true
                }
              }
            
              else {
                var.update $zincEngagementResult {
                  value = false
                }
              }
            }
          
            db.add PARTNER {
              data = {
                created_at                            : "now"
                name                                  : $item.Name
                description                           : $item["Description (Free Text)"]
                geographical_focus                    : $item["Geographical Focus"]
                past_zinc_engagement                  : $zincEngagementResult
                past_zinc_engagement_description      : $item["Past Zinc Engagement (Description)"]
                preferred_incentives_for_collaboration: ""
                preferred_communication_channel       : []
                partner_languages                     : []
                partner_audiences                     : []
                partner_topics                        : []
                partner_social_medias                 : []
                partner_entity_types                  : []
                partner_countries                     : []
                partner_contact_details               : []
                audience_follower_count               : $item["Social media followers (combined)"]|replace:",":""|to_int
                audience_general_description          : $item["Audience (free text)"]
                engagement_rate                       : $item["Engagement rate (social media)"]
                engagement_rate_classification        : $item["Engagement Rate Classification"]
              }
            } as $PARTNER1
          
            !function.run "" {
              input = {
                partner_id: $PARTNER1.id
                countries : $item.Country|split:", "
              }
            } as $add_country
          
            !function.run "" {
              input = {
                partner_id  : $PARTNER1.id
                entity_types: $item["Entity Type"]|split:", "
              }
            } as $add_entity
          
            !function.run "" {
              input = {
                partner_id: $PARTNER1.id
                languages : $item.Languages|split:", "
              }
            } as $add_language
          
            !function.run "" {
              input = {
                partner_id: $PARTNER1.id
                audiences : $item.Audience|split:", "
              }
            } as $add_audience
          
            !function.run "" {
              input = {
                partner_id     : $PARTNER1.id
                topics         : $item["Topic focus(es)"]|split:", "
                topic_free_text: $item["Topic focus (free text)"]
              }
            } as $add_topic
          
            function.run "Add Partner Contact to database" {
              input = {
                partner_id: $PARTNER1.id
                contacts  : $item["Contact information"]
              }
            } as $add_contact
          
            function.run "Add Partner Social Media to database" {
              input = {
                partner_id             : $PARTNER1.id
                preferred_social_medias: $item["Main communication channels"]|split:", "
                website                : $item.Website
                facebook               : $item.Facebook
                instagram              : $item.Instagram
                linkedin               : $item.LinkedIn
                telegram               : $item.Telegram
                tiktok                 : $item.TikTok
                x                      : $item.X
                youtube                : $item.YouTube
                vk                     : $item.VK
                ok                     : $item.OK
                other                  : $item["Other links"]
              }
            } as $add_social_media
          }
        }
      }
    }
  }

  response = "Partner database successfully added!"
  tags = ["partner-database"]
}
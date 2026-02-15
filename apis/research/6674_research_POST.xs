query research verb=POST {
  api_group = "Research"
  auth = "USER"

  input {
    dblink {
      table = "RESEARCH"
      override = {
        files_urls                : {hidden: true}
        proprietary_uploaded_files: {hidden: true}
      }
    }
  
    text[] files_data_urls? filters=trim
    text[] files_names? filters=trim
  }

  stack {
    var $attachments_list {
      value = []
    }
  
    var $files_names {
      value = $input.files_names
    }
  
    foreach ($input.files_data_urls) {
      each as $item {
        array.shift $files_names as $filename
        var $safe_filename {
          value = $filename
        }
      
        conditional {
          if ($safe_filename == null || $safe_filename == '""') {
            var.update $safe_filename {
              value = concat("file-", to_text(now()), ".bin")
            }
          }
        }
      
        storage.create_file_resource {
          filename = $safe_filename
          filedata = $item
        } as $file_resource
      
        storage.create_attachment {
          value = $file_resource
          access = "private"
          filename = ""
        } as $attachment_meta
      
        array.push $attachments_list {
          value = $attachment_meta
        }
      }
    }
  
    db.add RESEARCH {
      data = {
        created_at                : "now"
        intervention_id           : $input.intervention_id
        proprietary_findings      : $input.proprietary_findings
        proprietary_links         : $input.proprietary_links
        is_confirmed              : false
        research_sections_id      : $input.research_sections_id
        is_skipped                : $input.is_skipped
        proprietary_uploaded_files: $attachments_list
      }
    } as $model
  }

  response = $model
  tags = ["potentially inactive"]
}
class Attachment < Assets
  mount_uploader :data, AttachmentUploader, mount_on: :filename
end
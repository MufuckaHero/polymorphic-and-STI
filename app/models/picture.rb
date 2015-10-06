class Picture < Assets
	mount_uploader :data, PictureUploader, mount_on: :filename
end
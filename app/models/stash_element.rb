class StashElement < ApplicationRecord
	belongs_to :stash
	has_attached_file :file
	do_not_validate_attachment_file_type :file # Temporary while in development

	CONTENT_TYPES = [
		:text,
		:sms,
		:location,
		:photo,
		:file,
		:link
	]
end

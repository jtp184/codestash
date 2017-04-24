class StashElement < ApplicationRecord
	belongs_to :stash
	has_attatched_file :file
	do_not_validate_attachment_file_type :file # Temporary while in development
end

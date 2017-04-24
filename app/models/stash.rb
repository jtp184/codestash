class Stash < ApplicationRecord
	belongs_to :code
	has_many :stash_elements
end

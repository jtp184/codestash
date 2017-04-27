class Code < ApplicationRecord
	has_many :stashes

	def to_s
		"#{super} (@id: #{self.id}, @code_value: #{self.code_value})"
	end
end

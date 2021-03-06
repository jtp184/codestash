class Stash < ApplicationRecord
	belongs_to :code
	has_many :stash_elements

	before_create :defaults

	def self.finish(idnum)
		x = self.find(idnum)
		x.finalized = true
		x.save
		x.code.id
	end

	def self.cancel(idnum)
		x = self.find(idnum)
		ret = x.code.id
		x.destroy
		ret
	end

	def author
		self.stash_elements.first.text_content
	end

	def to_s
		"#{super} (@author: #{self.author}, elements: #{stash_elements.length} created: #{self.created_at})"
	end

	private

	def defaults
		self.finalized = false
	end
end

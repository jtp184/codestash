module StashBotsHelper
	def self.is_bot?(payload)
		!StashBot.where(secret_code: payload).empty?
	end
end

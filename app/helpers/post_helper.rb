module PostHelper
	URL_REGEX = /^((http[s]?|ftp):\/)?\/?([^:\/\s]+)((\/\w+)*\/)([\w\-\.]+[^#?\s]+)(.*)?(#[\w\-]+)?$/

	def self.get_url_base(url)
		base = URL_REGEX.match(url)[3]
		/(?:www\.)?(\w+\.\w+)/.match(base)[1]
	end
end

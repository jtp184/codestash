require 'securerandom'

class StashBot < ApplicationRecord
	before_create :defaults

	POST_FREQ = 10
	serialize(:prefs, Array)

	def self.create_posts(**opts)
		opts[:bots].each do |bot|
			bot.post_creator(code_id: opts[:codes].sample)
		end
	end

	def self.posts_by(bid)
		
	end

	def rank_image(labels)
		result = 0

		self.prefs.each_with_index do |label, index|
			result += ((1/(index+1)) * (labels[label] || 0))
		end

		result
	end

	# For requesting content to post.
	def request_image
		choices = []

		search_dir = Rails.root.join("public/fflow/labels")
		Dir.entries(search_dir).delete_if { |e| e =~ /^\.+$/ }.keep_if { |e| e =~ /\w+\.ya?ml/ }.each do |file|
			choices << Psych.load(File.open(Rails.root.join("public/fflow/labels/#{file}")))
		end

		choices.sort_by! { |c| rank_image(c[:labels]) }
		choices.first[:image] = File.open(Rails.root.join("public/fflow/images/#{choices.first[:filename]}"))

		File.delete(Rails.root.join("public/fflow/labels/#{/\d+(?=\.\w+)/.match choices.first[:filename]}.yml"))

		choices.first
	end

	def stash_photo(**opts)
		new_element = StashElement.new(text_content: "Photo", kind: 'photo', stash_id: opts[:stash].id)
		new_element.file = opts[:image]
		new_element.save
		new_element
	end

	def post_creator(**opts)
		post = Stash.new(code_id: opts[:code_id])
		post.save
		author_stash(post.id)

		grab_num = rand(POST_FREQ)

		grabbed_images = []

		grab_num.times do
			grabbed_images << request_image
		end

		grabbed_images.each do |grab_image|
			stash_photo(image: grab_image[:image], stash: post, title: grab_image[:title])
		end

		Stash.finish(post.id)
		post
	end

	def to_s
		"#<#{self.class} name: #{self.name}, secret_code: #{self.secret_code}>"
	end

	private

	def author_stash(sid)
		StashElement.new(text_content: self.name, kind: 'author', stash_id: sid).save
	end

	def get_name
		the_name = ""
		loop do
			words = File.readlines(Rails.root.join("public/words.txt")).map { |w| w.chomp }
			pat = /^#{('a'..'z').to_a.sample}/
			valids = words.select { |w| w =~ pat}
			the_name = "#{valids.sample.capitalize}#{valids.sample.capitalize}"
			return the_name if the_name.chars.length <= 12
		end
	end

	def defaults
		self.prefs = Psych.load(File.open Rails.root.join("public/fflow/categories.yml")).shuffle
		self.secret_code = SecureRandom.urlsafe_base64
		self.name = get_name
	end


end

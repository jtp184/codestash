require 'zxing'
require 'open-uri'

class CodeLookupController < ApplicationController
	def lookup
	end

	def virtual_scan
		redirect_to action: "show", cid: find_id(params[:code_value])
	end

	def upload
		uploaded_io = params[:picture]
		filename = "temp_barcode_#{Time.now().to_i}"
		extension = "#{uploaded_io.original_filename.split('.')[1]}"

		resolved_filename = Rails.root.join('tmp', 'uploads', "#{filename}.#{extension}")
		File.open(resolved_filename, 'w+b') { |file| file.write(uploaded_io.read) }

		puts resulting_key = ZXing.decode(URI.parse(URI.encode(resolved_filename.to_s)))

		if resulting_key.nil? || resulting_key == ''
			flash[:notice] = "Hmm... Try again?"
			File.delete(resolved_filename)
			redirect_to action: "lookup"
		elsif StashBotsHelper.is_bot?(resulting_key) 
			# TODO: Add bot code
		else
			# flash[:notice] = "Success! #{resulting_key}"
			File.delete(resolved_filename)
			# redirect_to action: "lookup"
			redirect_to action: "show", cid: find_id(resulting_key)
		end
	end

	def show
		begin
			# @stash = Code.find(params[:cid])
			@stashes = Stash.where(code_id: params[:cid], finalized: true)
		rescue StandardError
			flash[:notice] = "Invalid. Try something else."
			redirect_to action: "lookup"
		end
	end

	private

	def find_id(content)
		search_results = Code.where(code_value: content)
		if search_results.nil? || search_results.empty?
			new_code = Code.new()
			new_code.code_value = content
			new_code.save
			new_code.id
		else
			search_results.first.id
		end
	end
end

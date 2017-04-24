require 'zxing'

class CodeLookupController < ApplicationController
	def lookup
	end

	def upload
		uploaded_io = params[:picture]
		filename = "temp_barcode_#{Time.now().to_i}"
		extension = "#{uploaded_io.original_filename.split('.')[1]}"

		resolved_filename = Rails.root.join('tmp', 'uploads', "#{filename}.#{extension}")
		result = File.open(resolved_filename, 'w+b') { |file| file.write(uploaded_io.read) }

		resulting_key = ZXing.decode(open(resolved_filename, 'rb') { |io| io.read })

		if(resulting_key.nil? || resulting_key == '')
			flash[:notice] = "Not a Clear enough Picture"
			redirect_to action: "lookup"
		elsif false 
			# TODO: Add bot code
		else
			flash[:notice] = "Success! #{resulting_key}"
			# redirect_to action: "lookup"
			redirect_to action: "show", code_value: result
		end
	end

	def show
	end
end

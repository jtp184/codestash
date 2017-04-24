class CodeLookupController < ApplicationController
	def lookup
	end

	def upload
		uploaded_io = params[:picture]
		filename = "temp_barcode_#{Time.now().to_i}"
		extension = "#{uploaded_io.original_filename.split('.')[1]}"
		result = File.open(Rails.root.join('tmp', 'uploads', "#{filename}.#{extension}"), 'w+b') { |file| file.write(uploaded_io.read) }

		resulting_key = (ZXing.decode File.open(result)).to_s

		if(uploaded_code.content.eql? "")
			flash[:notice] = "Not a Clear enough Picture"
			redirect_to action: "lookup"
		elsif false 
			# TODO: Add bot code
		else
			redirect_to controller: "code", action: "show", code_value: result
		end
	end
end
